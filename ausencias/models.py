#creado con startapp dentro de myprojdjango

# hasta ahora van Tipo_ausencia_trb   Ausencia_trb

#estarian faltando clases vincs a salud de los trabahadores , juntas sentencias , cambios de funciones.....



from django.db import models

# Create your models here.
from django.db import connection
from django.contrib.auth.models import User
from datetime import datetime, date
from django.contrib.contenttypes.models import ContentType
### removed deprecated --> from django.contrib.contenttypes import generic
from django.utils.encoding import smart_unicode, smart_str
import time
from servicios.models import Asigna_lab

def fechaactual():
    factl=time.strftime('%Y-%m-%d')
    #factl=str(factl)
    
    return factl

####    class Meta:
####        db_table = 'trabajadores'
####        verbose_name_plural='Trabajadores Salud'
####        verbose_name = 'Trabajador'
####        ordering = ['-mr_statuslab','apellido']
####                                 
### licencias ao  embarazo preservacon examen articulos.etc parteenfermo enfprolongada  jubilacion articulos
class Tipo_Ausencia_trb(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=8)
#    descripcion = models.TextField(default='Lic x ..')



    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s - %s" % (cod,nom)

    


    class Meta:
        verbose_name_plural = 'Tipos de Ausencia '
        db_table = 'tipos_ausencias'


###     ausencia de un trabajador puede generar  , o NO , cobertura necesaria 
###      esta cobertura puede distribuirse entre muchas asignaciones laborales
###       del mismo o distinto trabajador ,
####       en formato reemplazo , horasextension  o contrato....
###
###        ausencia_trb.id es uno a muchos   Asignacion_lab.id
        
class Resultado_junta(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=8)
    descripcion = models.TextField(default='Lic x ..')



    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s - %s" % (cod,nom)

    class Meta:
        verbose_name_plural = 'Dictamenes de Junta '
        db_table = 'dictamenes_junta'

       
class Ausencia_trb (models.Model):
#   un trb no esta en sus funciones habituales por un periodo , puede o no , estar en otra actividad.    
    generavacgen = models.BooleanField(default=False,verbose_name='Vac Genuina')
    areadep = models.ForeignKey('entornos.Areadependencia',verbose_name='Area Dep')
    solicita_cobertura = models.BooleanField(default=False,verbose_name = 'X Cubrir')
    trabajador_ausente = models.ForeignKey('rechum.Trabajador',related_name = 'TrAreemp',null=True,verbose_name='Trabajador ausente')   
    institucion = models.ForeignKey('entornos.Institucion',null=True,blank=True,verbose_name='Institucion ')
    xdispo_junta = models.ForeignKey('Dispo_Junta',null=True,verbose_name ='X Dictamen Junta')
    xdispo_gestion = models.ForeignKey('Dispo_Gestion',null=True,verbose_name ='X Disposicion Gestion')
    cobertura_princ_por = models.ForeignKey('rechum.Trabajador',related_name ='TrCobertor',null=True , blank=True ,verbose_name='Cobertura Por')
    tipo_ausencia = models.ForeignKey('Tipo_ausencia_trb',null=True,verbose_name='Motivo de Solicitud')
    diagnostico = models.ForeignKey ('entornos.Diagnostico',null = True,verbose_name='Diagnostico')
    fecha_inicio = models.DateField(blank=True,null=True,verbose_name='Ini Ausencia')
    fecha_fin = models.DateField(blank=True,null=True,verbose_name='Fecha Fin Ausencia')
    usuario_registro = models.ForeignKey(to = User, verbose_name = 'Registrado por')
    fecha_insert = models.DateField(auto_now = True)
    comentarios = models.TextField(null=True,blank=True,verbose_name='Comentarios')
    #registro_adm = models.ForeignKey(to = User, verbose_name = 'Registro x')

    def tipoausup(self):
        tipoaus=self.tipo_ausencia.nombre
        tp=tipoaus.upper()
        return tp
    tipoausup.short_description = 'Motivo Ausencia'


    def coberturas(self):
        #determina si hay asignaciones labs vinculadas a esta ausencia....
        # cuantas y cuales son....
        dic="No Cobs"
        
        print """
                ------------------------------------------------

               EN def coberturas de Ausencia_trab

               ---------------------------------------------------
                    """
        
        pkn = self.id
        pks = str(pkn)
        if pks!='None':
            #al=servicios.Asigna_lab.objects.get(pk=pkn)
            #alx = al.xausenciatrab
            print "Hay ausencia de"
            print self.trabajador_ausente
            print self.id
            ###ahora veamso si ese id de ausencia tiene coberturas--
                
            cobs=Asigna_lab.objects.filter(xausenciatrab=pkn)
            
            print "Esta ausencia tiene las siguientes coberturas"
            print cobs
            if cobs:
                rcobs="CBS X:\n"
                for n in cobs:
                    rcobs+=str(n)+"\n"

            else:
                rcobs="NO"
            print
            dic=rcobs
        else:
            print """
                     Cobertura de ausencia no definida.....      

                     """
        

        return dic
    coberturas.short_description = 'Asgns Vinculadas'    

    def __unicode__(self):
        ape=smart_unicode(self.trabajador_ausente)
        nom=smart_unicode(self.tipo_ausencia.codigo)
        ape=ape.upper()
        nom=nom.upper()
        return "%s  %s-- D:%s" % (ape.upper(),nom.upper(),self.fecha_inicio)

    class Meta:
        db_table = 'ausencias_trbs'
        verbose_name_plural='Ausencias de Personal'
        verbose_name='Ausencia TRB'


class Junta_realizada(models.Model):
    LUGARDEJUNTA=((u'CESSO',u'Consultorio SSO'),
        (u'CEART',u'Consultorio ART'),
        (u'HPBLICO',u'Hospital Publico'),
        (u'MOVIL',u'Movil'))

    confirmada = models.BooleanField(default=False,verbose_name = 'CONS')
    lugardejunta = models.CharField(choices=LUGARDEJUNTA,max_length=16,verbose_name = 'LUGAR DE JUNTA')
    trabajador = models.ForeignKey('rechum.Trabajador',related_name = 'TraJuntap',verbose_name='Trabajador evaluado')   
    institucion = models.ForeignKey('entornos.Institucion',verbose_name='Institucion ')
    trb_evaluador_a = models.ForeignKey('rechum.Trabajador',related_name ='Evaluador_a',null=True,verbose_name='Evaluado Por')
    trb_evaluador_b = models.ForeignKey('rechum.Trabajador',related_name ='Evaluador_b',null=True,verbose_name='Evaluado Por')
    trb_evaluador_c = models.ForeignKey('rechum.Trabajador',related_name ='Evaluador_c',null=True,verbose_name='Evaluado Por')
    trb_evaluador_d = models.ForeignKey('rechum.Trabajador',related_name ='Evaluador_d',null=True,verbose_name='Evaluado Por')
    ausencia_referida = models.ForeignKey('Ausencia_trb',null=True,verbose_name='Ausencia Vinculada')
    fecha_evaluacion = models.DateField(blank=True,null=True,verbose_name='Ini Ausencia')
    diagnostico_a = models.ForeignKey ('entornos.ciediez',related_name='dgj_a',null = True,verbose_name='Diagnostico Principal')
    diagnostico_b = models.ForeignKey ('entornos.ciediez',related_name='dgj_b',null = True,verbose_name='Diagnostico B')
    diagnostico_c = models.ForeignKey ('entornos.ciediez',related_name='dgj_c',null = True,verbose_name='Diagnostico C')
    diagnostico_d = models.ForeignKey ('entornos.ciediez',related_name='dgj_d',null = True,verbose_name='Diagnostico D')
    fecha_fin = models.DateField(blank=True,null=True,verbose_name='Fecha Fin Ausencia')
    codigo = models.CharField(max_length=16)
    informe = models.TextField(default='Evaluacion Trabajador.....')
    descripcion = models.TextField(default='Lic x ..')
#    resultado = models.ForeignKey('Resultado_junta',verbose_name='Dictamen')

    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s - %s" % (cod,nom)

    class Meta:
        verbose_name_plural = 'Juntas Medicas'
        db_table = 'juntas_evaluacion'


class Dispo_Junta(models.Model):
    DISPOS=((u'LETP',u'Licencia Tiempo Prolongado'),
    (u'PTDIF',u'Pase a Tarea Diferente'),
    (u'LPEMB',u'Lic Proteccion Embarazo'),
    (u'RTEGRO',u'Reintegro Tarea Habitual'))
    disposicion = models.CharField(choices=DISPOS,max_length=16,verbose_name = 'Disposicion')
    activa = models.BooleanField(default=False,verbose_name = 'ACTIVA')
    trabajador = models.ForeignKey('rechum.Trabajador',null=True,verbose_name='Trabajador evaluado') 
    junta_determinante = models.ForeignKey('Junta_realizada',verbose_name='Junta evaluadora')
    ausencia_referida = models.ForeignKey('Ausencia_trb',null=True,verbose_name='Ausencia Vinculada')
    fecha_inicio = models.DateField(blank=True,null=True,verbose_name='Ini ')
    fecha_fin = models.DateField(blank=True,null=True,verbose_name='Fecha Fin Ausencia')
    codigo = models.CharField(max_length=8)
    informe = models.TextField(default='Detalle designacion TD.....')

    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s - %s" % (cod,nom)

    class Meta:
        verbose_name_plural = 'Disposiciones Tareas Diferentes'
        db_table = 'dispos_tdif'

class Dispo_Gestion(models.Model):
    DISPOS=((u'COMISION',u''),
    (u'CBIOFUNC',u''),
    (u'LSGSDO',u'Lic Sin Goce de Sueldo'),
    (u'RO',u'Re'))
    disposicion = models.CharField(choices=DISPOS,max_length=16,verbose_name = 'Disposicion')
    activa = models.BooleanField(default=False,verbose_name = 'ACTIVA')
    trabajador = models.ForeignKey('rechum.Trabajador',null=True,verbose_name='Trabajador evaluado') 
#    junta_determinante = models.ForeignKey('Junta_realizada',verbose_name='Junta evaluadora')
#    ausencia_referida = models.ForeignKey('Ausencia_trb',null=True,verbose_name='Ausencia Vinculada')
    fecha_inicio = models.DateField(blank=True,null=True,verbose_name='Ini ')
    fecha_fin = models.DateField(blank=True,null=True,verbose_name='Fecha Fin Ausencia')
    codigo = models.CharField(max_length=32)
    informe = models.TextField(default='Detalle designacion TD.....')

    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s - %s" % (cod,nom)

    class Meta:
        verbose_name_plural = 'Disposiciones Gestion RH'
        db_table = 'dispos_gestionrh'

