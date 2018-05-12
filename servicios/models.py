# -*- coding: utf-8 -*- 
# creadi copiando de todosmodels.py para servicios

from django.db import models
from django.db import connection
from django.contrib.auth.models import User
from datetime import datetime, date,timedelta
from django.contrib.contenttypes.models import ContentType
### removed deprecated --> from django.contrib.contenttypes import generic
from django.utils.encoding import smart_unicode, smart_str
import time

def default_hora_ini():
	defdt = datetime.now().replace (hour=16,minute=0,second=0,microsecond=0)
	return defdt

def default_user_id():
	defusrid = User.pk
	print "El defusrid es "
	print str(defusrid)
	return defusrid
	print str(defusrid)
dfu=default_user_id()


#  atencion para manejo de imagenes x ahora , antes de usar otro server como apache

##from django.core.files.storage import FyleSystemStorage
from django.core.files.storage import FileSystemStorage

print """

     en myprojdjango/servicios/models.py

"""
fs=FileSystemStorage(location='/media/Fotostrb')

def fechaactual():
    factl=time.strftime('%Y-%m-%d')
    #factl=str(factl)
    
    return factl


    
class Dia_Sm(models.Model):
    nombre = models.CharField(max_length=12)
    codigo = models.CharField(max_length=6)
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s" % (cod)

    class Meta:
        verbose_name_plural = 'Dias de la Semana'
        verbose_name = 'Dia Semana'
        db_table = 'ddlasem'
    

class Func_lab(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=12)
    descripcion = models.TextField(default='Descripcion ...')

    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s" % (cod)

    class Meta:
        verbose_name_plural = 'Funciones Laborales'
        verbose_name = 'Funcion'
        db_table = 'funclabs'
        ordering = ['nombre']



 
class Contrato (models.Model):
    trabajador = models.ForeignKey('rechum.Trabajador',verbose_name='Trabajador Contratado')   
    nhoras=models.IntegerField(null=True,blank=True,verbose_name='N de horas  ')    
    fecha_inicio = models.DateTimeField(verbose_name='Fecha Inicio Actividad')
    fecha_fin = models.DateTimeField(verbose_name='Fecha Finalizacion Actividad')
    fecha_solicitud = models.DateTimeField(blank=True,null=True,verbose_name='Fecha Solicitud')
    #empresa=
    usuario_registro = models.ForeignKey(to = User, verbose_name = 'Registrado por')
    xausenciatrab = models.ForeignKey('rechum.Ausencia_trb',null=True,blank=True,verbose_name='Cobertura Ausencia ')
    fecha_insert = models.DateField(auto_now = True)
    fecha_cobro = models.DateTimeField(null=True,blank=True,verbose_name='FechaCobro')
    #monto_cobro = models.
    comentarios = models.TextField(null=True,blank=True,verbose_name='Comentarios')
    #registro_adm = models.ForeignKey(to = User, verbose_name = 'Registro X')



    def __unicode__(self):
        ape=smart_unicode(self.apellido)
        nom=smart_unicode(self.nombre)
        ape=ape.upper()
        nom=nom.upper()
        return "%s  %s-- D:%s" % (ape.upper(),nom.upper(),self.numero_documento)
#


    class Meta:
        db_table = 'contratos'
        verbose_name_plural='Contratos Mensuales'



# PAQUETES DE REEMPLAZO MENSUAL cubren varias asignaciones laborales.....
# para ver que reemplaza hay que pasar por el vinculo con la asignacion laboral
##   manytomany
##   pensemos el reemplazo , vision djangoide , como una Publicacion , Revista
##   en ella hay varios articulos , aca todos del mismo autor, ue integran en esa public .
##   el autor es el trabjdor  la publ revista es el reempl mensual    el articu es una asignacion laboral... 
## para retrabajarlo en facturaciones de reemplazos..
##  ver en bitacora el tema many to many related
#### un reemplazo es  justiicado por un grupo de asignaciones
####  ejemplo de django person group membership
###  reemplazo homologa a grupo     asignalab homologa a persona    paquetereemp es homo log de membership


class Reemplazo (models.Model):
    trabajador = models.ForeignKey('rechum.Trabajador',verbose_name='Trabajador')
    #validado = models.BooleanField(verbose_name='Validado',default=False)
    nhoras=models.IntegerField(null=True,blank=True,verbose_name='N de horas ')    
### se integrarra con asignaciones laborales que sohn variadas.
    asglabs=models.ManyToManyField('Asigna_lab',verbose_name = 'Modulo asignado')
    fecha_inicio = models.DateField(verbose_name='Fecha Inicio Actividad')
    # como paquete reemp es mensual se usa solo fecha ...una 
    #fecha_fin = models.DateTimeField(verbose_name='Fecha Finalizacion Actividad')
    areadep = models.ForeignKey('entornos.Areadependencia',null=True,verbose_name='Area Responsable')
    fecha_solicitud = models.DateTimeField(blank=True,null=True,verbose_name='Fecha Solicitud')
    
    #data registro
    #trabajador = models.ForeignKey('Trabajador',related_name = 'TrRespSol',verbose_name='Responsable de Soliciud')   
    usuario_registro = models.ForeignKey(to = User,null=True,blank=True, verbose_name = 'Registrado por')
    fecha_insert = models.DateField(auto_now = True)
    fecha_cobro = models.DateTimeField(null=True,blank=True,verbose_name='FechaCobro')
    #monto_cobro = models.
    comentarios = models.TextField(null=True,blank=True,verbose_name='Comentarios')
    #registro_adm = models.ForeignKey(to = User, verbose_name = 'Registro X')

    #vamos a ver que asignaciones tiene ese reemplazo
    def InddAsgn(self):
        print """

                            def IndAsign en models.py m2m  en class Reemplazo

                            

                            """
        rp= self.pk

   ####  esta funcion , tiene un valor rp .pk  cuando esta modificando existetes
   ####   hay que pararla cuando esta creando uno nuevo , no tiene id todavia ....     
        print """

                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    obt el unicode de este reemplazo es

                    

                    """


        #################################ininuevo

        if rp:
            print"""
                    estamos en un rp existente
                    laboramos vpara generar Indasgn

                        """
            sq2="select asigna_lab_id from reemplazos_asglabs where reemplazo_id =%s"%str(rp)
            ##queaslabs==""
            curbas=connection.cursor()
            curbas.execute(sq2)
            paqals=curbas.fetchall()
            naslabs=0
            queaslabs='N R'
            if paqals:
                queaslabs=''
                for n in paqals:
                    naslabs+=1
                    idas=n[0]
                    #idaslab=str(idas)
                    alb=Asigna_lab.objects.get(pk=idas)
                    abinst=alb.institucion.codigo
                    dd=alb.Inddsem()
                    cad=abinst+':'+dd+' -'
                    queaslabs+=cad
            
            
            
        else:

            print"""

                    NONE  NO HAY REGISTRO TODAVIA
                    
                        SIN HACER RUIDO SALIMOS..

                                            """


            queaslabs=""
        return queaslabs
    
        
    InddAsgn.short_description ='Modulos--AsgLab'    
            

    def MesDelAnio(self):
        m=self.fecha_inicio.strftime('%b')
        a=self.fecha_inicio.strftime('%Y')
        mda = m +' del '+ a
        
        return mda

    MesDelAnio.short_description ='MesAño Trabajado'    



    def cuantosmesesatras(self):
        
        #fecha_nula = datetime.strptime('0000-00-00', "%Y-%m-%d")
        if self.fecha_inicio:
            today = date.today()
            return today.year - self.fecha_nacimiento.year - ((today.month, today.day) < (self.fecha_nacimiento.month, self.fecha_nacimiento.day))
        else:
            return "N/D"


    def anioreemp(self):
        anio=self.fecha_inicio.strftime("%Y")
        return anio
    
    def __unicode__(self):
        mesreemp=self.fecha_inicio.strftime("%b")
        anioreemp=self.fecha_inicio.strftime("%Y")
        ape=smart_unicode(self.trabajador)
        nom=smart_unicode(self.nhoras)
        #ape=ape.upper()
        #nom=nom.upper()
        return "T: %s - Periodo: %s - %s-- horas: %s" % (ape,mesreemp,anioreemp,nom)
##


    class Meta:
        db_table = 'reemplazos'
        verbose_name_plural='Reemplazos Mensual'

        
        

###  al igual que reauessplazos , y contratos varios asignaciones laborales pueden estar vinculados al mismo extension
###   extension.id es uno a muchos
###   reemplazo.id es uno a muchos
        
class Extension (models.Model):
    trabajador = models.ForeignKey('rechum.Trabajador',verbose_name='Trabajador')   
    asignalab = models.ForeignKey('Asigna_lab',verbose_name='Para cumplir Asignacion ')
    #xausenciatrab = models.ForeignKey('ausencias.Ausencia_trb',null=True,blank=True,verbose_name='Cobertura Ausencia ')
    nhoras=models.IntegerField(null=True,blank=True,verbose_name='N de horas ')    
#original    fecha_inicio = models.DateTimeField(verbose_name='Fecha Inicio Modulo Reemplazo')
    fecha_inicio = models.DateTimeField(default=default_hora_ini,verbose_name='Fecha Inicio Extension')
 
    fecha_fin = models.DateTimeField(verbose_name='Fecha Finalizacion Actividad')
    #motreemp = models.ForeignKey('Ausencia_trabs',null=True,verbose_name='Motivo de Solicitud')
    fecha_solicitud = models.DateTimeField(blank=True,null=True,verbose_name='Fecha Solicitud')
    #data registro
    #trabajador = models.ForeignKey('Trabajador',related_name = 'TrRespSol',verbose_name='Responsable de Soliciud')   
    usuario_registro = models.ForeignKey(to = User, verbose_name = 'Registrado por')
    fecha_insert = models.DateField(auto_now = True)
    fecha_cobro = models.DateTimeField(null=True,blank=True,verbose_name='FechaCobro')
    #monto_cobro = models.
    comentarios = models.TextField(null=True,blank=True,verbose_name='Comentarios')
    #registro_adm = models.ForeignKey(to = User, verbose_name = 'Registro X')



    def __unicode__(self):
        ape=smart_unicode(self.trabajador.apellido)
        nom=smart_unicode(self.fecha_inicio)
        ape=ape.upper()
        nom=nom.upper()
        return " %s-- D:%s" % (ape.upper(),nom.upper())
##


    class Meta:
        db_table = 'extensiones'
        verbose_name_plural='Extensiones Horarias '

        


### MODULOS PEQUEÑOS DE COBERTURAS QUE PUEDEN SUMARSE PARA ENTENDER QUE HACE UN TRABAJADOR EN EL MISMO MES
###  VARIOS DE ELLOS pueden tener 0 nreferir a mismo id de Reemplazo o Extension horaria ...
###  cada fragmento , una asigna_lab ,un trabajador un dia , con ext horarioa  o siendo reemplaznate
##   se vinculan a la misma ausencia         
###        varios de ellos pueden referrir a misma         

        
class Asigna_lab(models.Model):
    
    MODOSEMANAL = ((u'TLD', u'Todas las Semanas'),
                       (u'UDS', u'Semana x medio'),
                        (u'LAV', u'Rotativo'),(u'XTR', u'ExtraOrdinario')
                 )
    FORMATO = ((u'REG', u'Regular'),
                       (u'KBT', u'Cubre Ausencia'),
                        (u'CTO',u'Contrato'))

    DEPENDENCIA = ((u'NUNI', u'Municipalidad'),
                       (u'PROVI', u'Provincial'),
                        (u'NACION',u'Nacion'))


    activo = models.BooleanField(verbose_name='Activo',default=True)
    dependencia = models.CharField(choices=DEPENDENCIA,max_length=18,default='MUNI') 
    #ut infra un m2m que agrupa varios dias
    dds = models.ManyToManyField('entornos.Dds',verbose_name='DiasSemanales')
    trabajador = models.ForeignKey('rechum.Trabajador',verbose_name='Trabajador')
    tipoasignacion = models.CharField(choices=FORMATO,max_length=12,default='REG',verbose_name='Tipo Asignacion')
    #vinculo a registros de extras 
    #esextensionhoraria = models.ForeignKey('Extension',null=True,blank=True,verbose_name='Extension horas')    
    profesion = models.ForeignKey('entornos.Profesion',null=True,blank=True,verbose_name='PROFESION')
    #escontrato = models.ForeignKey('Contrato',null=True,blank=True,verbose_name='Contrato')
    areadep = models.ForeignKey('entornos.Areadependencia',null=True,blank=True,verbose_name='Area Responsable')
    #soldeasig = models.ForeignKey('Sol_deasig',null=True,verbose_name='Detalle de Solicitud')   
    institucion = models.ForeignKey('entornos.Institucion',null=True,blank=True,verbose_name='Institucion Referente')
    servicio = models.ForeignKey('entornos.Servicio',null=True,blank=True,verbose_name='Servicio Servicio Referente')
    funcion = models.ForeignKey('Func_lab',verbose_name='Funcion')
    espec = models.ForeignKey('entornos.Especialidad',blank=True,null=True,verbose_name='Esp')
    fecha_inicio = models.DateField(verbose_name='Fecha Inicio Actividad')
    fecha_fin = models.DateField(blank=True,null=True,verbose_name='Fecha Fin Actividad')
    #diasemana = choi
    modosemanal = models.CharField(choices=MODOSEMANAL,max_length=18,verbose_name = 'Frecuencia mensual')
    #diasemana = models.CharField(choices=DIASEMANA,max_length=12,verbose_name ='Dia de la Semana')
    horasxdia = models.IntegerField(verbose_name='Horas x Dia')
#    frecuencia = models.CharField(choices=FRECUENCIA,max_length=12,verbose_name='Frecuencia',default='R/1')
#   Para ocasion de funciones en reemplazo...
    comentarios = models.TextField(max_length=128, null=True, blank=True)
    #data registro
    #### Vinculo a ver si es x ausencia especifica de alguien 
    xausenciatrab = models.ForeignKey('rechum.Ausencia_trb',null=True,blank=True,verbose_name='Cubre Ausencia ')
    usuario_registro = models.ForeignKey(to = User, null=True,blank=True,verbose_name = 'Registrado por')
    fecha_registro = models.DateField(auto_now = True)
    #registro_adm = models.ForeignKey(to = User, verbose_name = 'Registro X')

    # para segui r trabanando...
    def Tiempoactiva(self):
        
        #fecha_nula = datetime.strptime('0000-00-00', "%Y-%m-%d")
        if not self.fecha_fin:
            today = date.today()
            return today.year - self.fecha_nacimiento.year - ((today.month, today.day) < (self.fecha_nacimiento.month, self.fecha_nacimiento.day))
        else:
            return "fin el "

    def Inddsem(self):
        print """
                            def Inddsem en models.py en class Asigna Lab
        -------------------------------------------------------------------------
                            """
        cur = connection.cursor()
        pks = self.id
        print "el id de la asigna lab es %s"%pks
        pks = str(pks)
        print """

            atencion aca pks
             es   %s

            """%pks
        pk=str(pks)
        if pk!='None':
            print " vamos a usar ese valor"
            print pk
            sq="select nombre from entornos_dds where id in (select dds_id from asignalabs_dds where asigna_lab_id = "
            sq+=pks
            sq+=')'
            print sq
            cur.execute(sq)
            listadsm = cur.fetchall()
            ldsm =''
            for n in listadsm:
                n=n[0]
                ldsm+=n+'-'
                
        else:
            print """

            Cino arranco no habia definido el id...

"""
            ldsm ='No def'
            
##        cur.execute(sq)
##        listadsm=cur.fetchall()
##        ldsm=''
##        for n in listadsm:
##            n=n[0]
##            ldsm+=n+' - '
        print ldsm    
        return ldsm
        
    Inddsem.short_description ='Dias de la Semana'    
            
    def esxausencia(self):
        if self.xausenciatrab:
            exa='Si'
        else:
            exa='No'
            
        return exa
    esxausencia.short_description ='XAus'

    def estavigente(self):
        if self.xausenciatrab:
            exa='Si'
        else:
            exa='No'
            
        return exa
    estavigente.short_description ='Vgencia'
 
    
    ## calcula horas semanal de esta asignacion        
    def __unicode__(self):
        cur = connection.cursor()
        pks = self.id
        print "el id de la asigna lab es %s"%pks
        pks = str(pks)
        sq="select nombre from entornos_dds where id in (select dds_id from asignalabs_dds where asigna_lab_id = "
        sq+=pks
        sq+=')'
        
        print sq
        cur.execute(sq)
        listadsm=cur.fetchall()
        #obtuve una tupla de tuplas
        ldsm=''
        for n in listadsm:
            n=n[0]
            ldsm+=n+' - '
        print ldsm    
        
        ape=smart_unicode(self.trabajador.apellido)
        nom=smart_unicode(self.funcion.nombre)
        ape=ape.upper()
        nom=nom.upper()
##        if self.fecha_fin:
##            ff=date.strftime(date.today(),"%d-%b-%Y")
##            
##        else:
##            ff="! Sin ffin"
##

        
        if self.servicio:
            sv=self.servicio.codigo
        else:
            sv=" - "

        if self.institucion:
            inst=self.institucion.codigo
        else:
            inst =" - "



        return "%s  %s-   %s" % (ape.upper(),inst,ldsm)
##


    class Meta:
        db_table = 'asignalabs'
        verbose_name_plural='Asignaciones laborales'
        verbose_name='Asignacion'




       
class Guardia(models.Model):
#cada porcion de horas continuas en que un profesional cubre una funcion    
# rol del trab es Rol
# una guardia de un dia en un lugar para una especialidad pueden ser muchas de estas , una por cada trabajador ....


#presencia
    TIPOS = ((u'ACTIVO', u'Activo'),
                       (u'PASIVO', u'Pasivo'),
                        (u'DIF',u'Dif'),
                 )
#habitualidad

    MODOS = ((u'REG', u'Regular'),
                       (u'CBA', u'Cubre Ausencia'),
                        )
#responsabilidad
    RESPONS = ((u'J G', u'Jefe Dia'),
                       (u'Esp', u'Especialista'),
                        (u'DIF',u'Dif'),
                )  
		
    vigencia = models.BooleanField(default=True,verbose_name='Vigencia')
    #ut infra un m2m que agrupa varios dias
    #dds = models.ManyToManyField('dataextra.Dds',verbose_name='DiasSemanales')
    trabajador = models.ForeignKey('rechum.Trabajador',blank=True,null=True,verbose_name='Trabajador')
    tipopresencia = models.CharField(choices=TIPOS,max_length=12,default='ACT',verbose_name='Tipo Presencial')
    modo = models.CharField(choices=MODOS,max_length=12,default='ACT',verbose_name='Tipo Presencial')
    responsabilidad = models.CharField(choices=RESPONS,max_length=12,default='REG',verbose_name ='Dia de la Semana')
    profesion = models.ForeignKey('entornos.Profesion',null=True,blank=True,verbose_name='PROFESION')
    institucion = models.ForeignKey('entornos.Institucion',null=True,blank=True,verbose_name='Institucion Referente')
    servicio = models.ForeignKey('entornos.Servicio',null=True,blank=True,verbose_name='Servicio Servicio Referente')
    #funcion = models.ForeignKey('Func_lab',verbose_name='Funcion')
    espec = models.ForeignKey('entornos.Especialidad',blank=True,null=True,verbose_name='Esp')
    fecha_inicio = models.DateTimeField(default=default_hora_ini,verbose_name='Fecha Inicio Actividad')
    fecha_fin = models.DateTimeField(blank=True,null=True,verbose_name='Fecha Fin Actividad')
    #hora_inicio = models.TimeField(verbose_name='Fecha Inicio Actividad')
    #hora_fin = models.TimeField(blank=True,null=True,verbose_name='Fecha Fin Actividad')
    comentarios = models.TextField(max_length=128, null=True, blank=True)

    #### Vinculo a ver si es x ausencia especifica de alguien 

    usuario_registro = models.ForeignKey(to = User, null=True,blank=True,verbose_name = 'Registrado por')
    fecha_registro = models.DateField(auto_now = True)
    #registro_adm = models.ForeignKey(to = User, verbose_name = 'Registro X')

    # para segui r trabanando...
    def Tiempoactiva(self):
        
        #fecha_nula = datetime.strptime('0000-00-00', "%Y-%m-%d")
        if not self.fecha_fin:
            today = date.today()
            return today.year - self.fecha_nacimiento.year - ((today.month, today.day) < (self.fecha_nacimiento.month, self.fecha_nacimiento.day))
        else:
            return "fin el "

    def Inddsem(self):
        print """
                            def Inddsem en models.py en class Asigna Lab
        -------------------------------------------------------------------------
                            """
        cur = connection.cursor()
        pks = self.id
        print "el id de la asigna lab es %s"%pks
        pks = str(pks)
        print """

            atencion aca pks
             es   %s

            """%pks
        pk=str(pks)
        if pk!='None':
            print " vamos a usar ese valor"
            print pk
            sq="select nombre from dataextra_dds where id in (select dds_id from asignalabs_dds where asigna_lab_id = "
            sq+=pks
            sq+=')'
            print sq
            cur.execute(sq)
            listadsm = cur.fetchall()
            ldsm =''
            for n in listadsm:
                n=n[0]
                ldsm+=n+'-'
                
        else:
            print """

            Cino arranco no habia definido el id...

"""
            ldsm ='No def'
            
##        cur.execute(sq)
##        listadsm=cur.fetchall()
##        ldsm=''
##        for n in listadsm:
##            n=n[0]
##            ldsm+=n+' - '
        print ldsm    
        return ldsm
        
    Inddsem.short_description ='Dias de la Semana'    
            
    def esxausencia(self):
        if self.xausenciatrab:
            exa='Si'
        else:
            exa='No'
            
        return exa
    esxausencia.short_description ='XAus'
    
    ## calcula horas semanal de esta asignacion        
    def __unicode__(self):
        cur = connection.cursor()
        pks = self.id
        print "el id de la asigna lab es %s"%pks
        pks = str(pks)
        sq="select nombre from dataextra_dds where id in (select dds_id from asignalabs_dds where asigna_lab_id = "
        sq+=pks
        sq+=')'
        
        print sq
        cur.execute(sq)
        listadsm=cur.fetchall()
        #obtuve una tupla de tuplas
        ldsm=''
        for n in listadsm:
            n=n[0]
            ldsm+=n+' - '
        print ldsm    
        
        ape=smart_unicode(self.trabajador.apellido)
        nom=smart_unicode(self.funcion.nombre)
        ape=ape.upper()
        nom=nom.upper()
##        if self.fecha_fin:
##            ff=date.strftime(date.today(),"%d-%b-%Y")
##            
##        else:
##            ff="! Sin ffin"
##

        
        if self.servicio:
            sv=self.servicio.codigo
        else:
            sv=" - "

        if self.institucion:
            inst=self.institucion.codigo
        else:
            inst =" - "



        return "%s  %s-   %s" % (ape.upper(),inst,ldsm)
##


    class Meta:
        db_table = 'guardias'
        verbose_name_plural='Guardias'
        verbose_name='Guardia'



