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

class cuporEspecialidad(models.Model):
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

## objeto clase que muestra pakete de turnos de esa esp en esa inst en oferta total
class Pak_of(models.Model):
    PERIODO = ((u'SMNL', u'Semanal'),
                       (u'QNCNL', u'Quincenal'),
                       (u'MNSL', u'Mensual'))


    srvcupor = models.ForeignKey('cuporEspecialidad',verbose_name='SRV-ESP')
    fecha_ini = models.DateField(null=True,blank=True,verbose_name='Fecha Cons')
    institucion = models.ForeignKey('entornos.Institucion',verbose_name = 'INST RFRNTE')
    periodo = models.CharField(choices=PERIODO,max_length=12,default='SMNL',verbose_name='Periodo')
    toturnos = models.IntegerField(default = 100,verbose_name='Turnos Tots')
    acupturnos = models.IntegerField(default = 80,verbose_name='Dispo x CUP')
    asglabs = models.ManyToManyField('servicios.Asigna_lab',verbose_name = 'Modulos Asignados')
    fecha_fin = models.DateField(null=True,blank=True,verbose_name='Fin de Validez')
    comentarios = models.CharField(max_length=369,default='Comentarios',verbose_name='Comentarios')
    def xfActivo(self):
        if not self.fecha_fin:
            esactv='Activo'
        else:
            esactv='Finalizado'
        return esactv
    xfActivo.short_description = 'PktOfActivo'
 
    def __unicode__(self):
        #print "-------    en unicode de class Pakof -------------------"
        if self.fecha_fin:
            ea='No'
        else:
            ea='Si'
        #print ea
        fcons=self.fecha_ini
        qcupor=str(self.srvcupor)
        return "%s %s-%s:"%(ea,qcupor,fcons)       

    class Meta:
        db_table = 'acupor_ofertas'
        verbose_name ='Paquete InstSrvEsp'        
        verbose_name_plural ='Pktes Cuporizables'        
        ordering = ['institucion','srvcupor']


class Pak_cupo(models.Model):
    PERIODO = ((u'DTTECH', u'Datatech'),
                       (u'SISR', u'Sist-APS'),
                       (u'OTROS', u'Otros'))

    inst = models.ForeignKey('entornos.Institucion',verbose_name='Cupo Para ')
    depak = models.ForeignKey('Pak_of',verbose_name='Origen')
    fecha_ini = models.DateField(null=True,blank=True,verbose_name='Fecha Hab')
    sistema = models.CharField(choices=PERIODO,max_length=12,default='SISR',verbose_name='Sist Agenda')
    ncupo = models.IntegerField(default = 2,verbose_name='Cupo')
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


