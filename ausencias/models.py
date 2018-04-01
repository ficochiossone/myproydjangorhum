#creado con startapp dentro de myprojdjango

# hasta ahora van Tipo_ausencia_trb   Ausencia_trb


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
        
       
class Ausencia_trb (models.Model):
#   un trb no esta en sus funciones habituales por un periodo , puede o no , estar en otra actividad.    
    generavacgen = models.BooleanField(default=False,verbose_name='Vac Genuina')
    areadep = models.ForeignKey('entornos.Areadependencia',verbose_name='Area Dep')
    solicita_cobertura = models.BooleanField(default=False,verbose_name = 'X Cubrir')
    trabajador_ausente = models.ForeignKey('rechum.Trabajador',related_name = 'TrAreemp',null=True,verbose_name='Trabajador ausente')   
    institucion = models.ForeignKey('entornos.Institucion',null=True,blank=True,verbose_name='Institucion ')
    xdispo_junta = models.ForeignKey('rechum.Dispo_Junta',null=True,verbose_name ='X Dictamen Junta')
    xdispo_gestion = models.ForeignKey('rechum.DispoDesiDec',null=True,verbose_name ='X Disposicion Gestion')
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



