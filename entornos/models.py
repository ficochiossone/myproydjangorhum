# creado por startapp y luego retocado por todosmodels.py
# classses:  institucion servicio  profesion especialidad areasdependencia
 

from django.db import models
from django.db import connection
from django.contrib.auth.models import User
from datetime import datetime, date
from django.contrib.contenttypes.models import ContentType
### removed deprecated --> from django.contrib.contenttypes import generic
from django.utils.encoding import smart_unicode, smart_str

# Create your models here.


class Dds(models.Model):


    nombre = models.CharField(max_length=14)
    codigo = models.CharField(max_length=6)
    num = models.IntegerField()
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s - %s" % (cod,nom)


    class Meta:
        #db_table = 'sqlscripts'
        verbose_name_plural ='Dias de Semana'        
        verbose_name ='Dia Semanal'        


class Institucion(models.Model):
    nombre = models.CharField(max_length=64,unique=True)
    codigo = models.CharField(max_length=12)
    descripcion = models.CharField(max_length=64,default='Descripcion..') 
    domicilio = models.CharField(max_length=128,blank=True)
    telefonos = models.CharField(max_length=128,default='341 ....' )
    #codigo_postal = models.ForeignKey('CodigoPostal', blank=True, null=True)
    #complejidad = models.ForeignKey('Complejidad',blank=True,null=True)
    email = models.EmailField(blank=True)
    web = models.URLField(blank=True,verbose_name='Sitio Web')
    comentarios = models.TextField(null=True,blank=True,default='Comentarios...')

    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s" % (cod)

    class Meta:
        db_table = 'instituciones'
        verbose_name = 'institucion'
        verbose_name_plural = 'Instituciones'
        ordering = ['codigo']
        

class Servicio(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=8)
    #institucion y especialidad posibles
    descripcion = models.TextField(default='Descr.....')

    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s" % (cod)

    class Meta:
        db_table = 'servicios'
        ordering = ['codigo']

#

class Profesion(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=8)
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s - %s" % (cod,nom)

    class Meta:
        db_table = 'profesiones'
        verbose_name_plural ='Profesiones'        
        verbose_name ='Profesion'        
        ordering = ['nombre']

class Especialidad(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=8)
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return " %s" % (cod)

    class Meta:
        db_table = 'especialidades'
        verbose_name ='Especialidad'        
        verbose_name_plural ='Especialidades'        
        ordering = ['nombre']


class Areadependencia(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=8)
    responsable = models.ForeignKey('rechum.Trabajador',verbose_name ='Responsable del area')
    
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return " %s" % (cod)

    class Meta:
        db_table = 'areasdependencia'
        verbose_name ='Area de Dependencia'        
        verbose_name_plural ='Areas de Dependencia'        
        ordering = ['codigo']



