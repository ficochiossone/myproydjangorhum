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
        db_table = 'cupor_servicios'
        verbose_name ='Servicio Cuporizable'        
        verbose_name_plural ='Servicios Cuporizables'        
        ordering = ['nombre']

class cuporEspecialidad(models.Model):
    dqserv = models.ForeignKey('cuporServicio',verbose_name='Servicio Referente')
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=12)
    areadep = models.ForeignKey('entornos.Areadependencia',verbose_name='Area de Dependencia')
    descripcion = models.CharField(max_length=124,default = 'Descripcion')
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return " %s" % (cod)

    class Meta:
        db_table = 'cupor_especialidades'
        verbose_name ='Especialidad Cuporizable'        
        verbose_name_plural ='Especialidades Cuporizables'        
        ordering = ['nombre']

## objeto clase que muestra pakete de turnos de esa esp en esa inst en oferta total
class Pak_of(models.Model):
    PERIODO = ((u'SMNL', u'Semanal'),
                       (u'QNCNL', u'Quincenal'),
                       (u'MNSL', u'Mensual'))


    srvcupor = models.ForeignKey('cuporEspecialidad',verbose_name='SRV-ESP')
    fecha_ini = models.DateField(null=True,blank=True,verbose_name='Fecha Inicio')
    institucion = models.ForeignKey('entornos.Institucion',verbose_name = 'INST OFRNTE')
    periodo = models.CharField(choices=PERIODO,max_length=12,default='SMNL',verbose_name='Periodo')
    toturnos = models.IntegerField(default = 100,verbose_name='Turnos Tots')
    acupturnos = models.IntegerField(default = 80,verbose_name='A CUP')
    fecha_fin = models.DateField(null=True,blank=True,verbose_name='Fin de Validez')

class Pak_cupo(models.Model):
    PERIODO = ((u'DTTECH', u'Datatech'),
                       (u'SISR', u'Sist-APS'),
                       (u'OTROS', u'Otros'))


    depak = models.ForeignKey('Pak_of',verbose_name='Origen')
    fecha_ini = models.DateField(null=True,blank=True,verbose_name='Fecha Hab')
    sistema = models.CharField(choices=PERIODO,max_length=12,default='SISR',verbose_name='Sist Agenda')
    ncupo = models.IntegerField(default = 2,verbose_name='Cupo')
    #fecha_fin = models.DateField(null=True,blank=True,verbose_name='Fin de Validez')
    comentarios = models.TextField(default = 'Comentarios')


