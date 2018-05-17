# creado por startapp y luego retocado por todosmodels.py
# classses:  ara cuporizar
 

from django.db import models
from django.db import connection
from django.contrib.auth.models import User
from datetime import datetime, date
from django.contrib.contenttypes.models import ContentType
### removed deprecated --> from django.contrib.contenttypes import generic
from django.utils.encoding import smart_unicode, smart_str

# Create your models here.
## esta clase , vinc a uso de sistemas viejos dttech y sis rosario mezcla conceptos
## vg un servicio podria ser trumatologia o enfermeria
## las cupor esps pueden ser subespecialidades o especialidades vinculadas o servicios dados por dispositivos.
##   una ecografia figura como una especialidad dependiente de un servicio diagn x imagenes...

class cuporServicio(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=10)
    descripcion = models.CharField(max_length=612)
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return " %s" % (cod)

    class Meta:
        db_table = 'acupor_servicios'
        verbose_name ='Servicio troncal'        
        verbose_name_plural ='Servicios Troncales'        
        ordering = ['codigo']

class PkSrvEsp(models.Model):
    dqserv = models.ForeignKey('cuporServicio',verbose_name='Servicio Referente')
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=12)
    areadep = models.ForeignKey('entornos.Areadependencia',verbose_name='Area de Dependencia')
    descripcion = models.CharField(max_length=524,default = 'Descripcion')
    def __unicode__(self):
        dqs=str(self.dqserv.codigo)
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return " %s-%s" % (dqs,cod)

    class Meta:
        db_table = 'acupor_especs'
        verbose_name ='SRV/Sub'        
        verbose_name_plural ='SubServicios'        
        ordering = ['codigo']

## objeto clase que muestra pakete de turnos de esa SERVesp en  UNAinst
## expresa como se integra asglabs y cuantos turnos totales y cuantos a dispo del resto de la red.
class Pak_of_inst(models.Model):
    PERIODO = ((u'SMNL', u'Semanal'),
                       (u'QNCNL', u'Quincenal'),
                       (u'MNSL', u'Mensual'))
    SISTEMA= ((u'DTTECH', u'Datatech'),
                       (u'SISR', u'Sist-APS'),
                       (u'OTROS', u'Otros'))


    activo = models.BooleanField(default=True,verbose_name='Validez')
    sistema = models.CharField(choices=SISTEMA,max_length=6,default='DTTECH',verbose_name='SIST AGENDA')
    srvcupor = models.ForeignKey('PkSrvEsp',verbose_name='PKSRVESP')
    fecha_ini = models.DateField(null=True,blank=True,verbose_name='Fecha Cons')
    institucion = models.ForeignKey('entornos.Institucion',verbose_name = 'INST RFRNTE')
    periodo = models.CharField(choices=PERIODO,max_length=12,default='SMNL',verbose_name='Periodo')
    turnos = models.IntegerField(default = 100,verbose_name='Turnos Tots')
    acupturnos = models.IntegerField(default = 80,verbose_name='Dispo x CUP')
    asglabs = models.ManyToManyField('servicios.Asigna_lab',verbose_name = 'Modulos Asignados')
    fecha_fin = models.DateField(null=True,blank=True,verbose_name='Fin de Validez')
    comentarios = models.CharField(max_length=369,default='Comentarios',verbose_name='Comentarios')

# una funcion para obtener un campo que muestre las asignaciones laborales vinculadas 
# a este pakete ofrecido..  vinculamos tablas  en tabla mixta many to many
#   tabla mixta es acupor_ofertas_inst_asglabs  se unen pak_of_inst_id   y asigna_lab_id

    def Ofrnts(self):
        rp=self.pk # identificamos el pakete of
        lista = ""
        if rp:
            pakof=Pak_of_inst.objects.get(pk=rp)
            asgofs=pakof.asglabs.all()
            lista=""
            for n in asgofs:
                prof=str(n.trabajador)
                lista+=prof+"-"          
                           
        return lista
    Ofrnts.short_description = 'Profesionales'


 
    def __unicode__(self):
        #print "-tien que tener total cupos disp  institucion y especialidad--"
        ins=self.institucion.codigo
        if self.fecha_fin:
            ea='No'
        else:
            ea='Si'
        #print ea
        tott=self.acupturnos
        qcupor=str(self.srvcupor.codigo)
        return "#%s:%s>%s-(%s)"%(str(self.id),ins,qcupor,str(tott))       

    class Meta:
        db_table = 'acupor_ofertas_inst'
        verbose_name ='Paquete InstSrvEsp'        
        verbose_name_plural ='Pktes X INST'        
        ordering = ['institucion','srvcupor']


# clase que define una institucion que es priorizada para un srvesp con un numero de turnos..
# define de que inst viene.......
class Pak_cupo(models.Model):
    PERIODO = ((u'SMNL', u'Semanal'),
                       (u'QNCNL', u'Quincenal'),
                       (u'MNSL', u'Mensual'),
                       (u'OTROS',u'OTROS'))

    inst = models.ForeignKey('entornos.Institucion',verbose_name='Institucion')
    depak = models.ForeignKey('Pak_of_inst',verbose_name='Origen Turnos')
    #nturnos = models.IntegerField(default=1,verbose_name='TotalTurnos')
    fecha_ini = models.DateField(null=True,blank=True,verbose_name='Fecha Hab')
    periodo = models.CharField(choices=PERIODO,max_length=12,default='SMNL',verbose_name='PERIODO')
    ncupo = models.IntegerField(default = 2,verbose_name='Cupo')
    #asgpaks = models.ManyToManyField('Pak_of_inst',verbose_name = 'Paketes integrantes')
 
    #fecha_fin = models.DateField(null=True,blank=True,verbose_name='Fin de Validez')
    comentarios = models.TextField(default = 'Comentarios')

    def xfActivo(self):
        if not self.fecha_fin:
            esactv='Activo'
        else:
            esactv='Finalizado'
        return esactv
    xfActivo_short_description = 'Estado ACt'
 
    def __unicode__(self):
        inst=self.inst.codigo
        fcons=self.fecha_ini
        dep=self.depak
        cuantos=self.ncupo
        return "%s>>%s- %s-%s cupos"%(inst,dep,fcons,str(cuantos))       

    class Meta:
        db_table = 'acupor_pakscupos'
        verbose_name ='Cupo definido'        
        verbose_name_plural ='Cupos Determinados'        
        ordering = ['inst','depak']


