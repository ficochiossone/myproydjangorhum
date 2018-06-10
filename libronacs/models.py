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




print """ 

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx








el usr id por defecto es %s 

el time def es %s




xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
""" %(str(dfu),str(default_hora_ini))

#  atencion para manejo de imagenes x ahora , antes de usar otro server como apache

##from django.core.files.storage import FyleSystemStorage
from django.core.files.storage import FileSystemStorage

print """

     Vamos a preparar para guardar fotos de trabajadores...

"""
fs=FileSystemStorage(location='/media/Fotostrb')
print """

las fotostrtb estan en

       %s

------------------------------------
------------------------------------
"""% str(fs)

print "servicios models.py  va a def fecha actual ......"


def fechaactual():
    factl=time.strftime('%Y-%m-%d')
    #factl=str(factl)
    
    return factl


   

class Patos_madre(models.Model):
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
        verbose_name_plural = 'Patologias Maternas'
        verbose_name = 'Ptlgia Materna'
        db_table = 'patos_mat'
        ordering = ['nombre']



 
class Nacimiento (models.Model):


     SEXOS = (('M', 'masculino'),
             ('F', 'femenino'),
             ('I', 'no determinado'))

     MODOS = (('PVAGNL', 'Parto Vaginal'),
             ('CSAREA', 'Cesarea'),
             ('I', 'no determinado'))

     CDSALTA = (('AM', 'Alta Medica'),
             ('RETVOL', 'Retiro Voluntario'),
             ('TRLDDRV', 'Traslado Derivacion'))

 
     madre = models.ForeignKey('oytred.Paciente',verbose_name='Madre')   
     nsemanas=models.IntegerField(default=36,null=True,blank=True,verbose_name='N de semanas')    
     fecha_internacion_madre = models.DateTimeField(verbose_name='Fecha Internacion Madre')
     fecha_nacimiento = models.DateTimeField(verbose_name='Fecha Nacimiento')
     fecha_alta = models.DateTimeField(blank=True,null=True,verbose_name='Fecha Solicitud')
    #empresa=
     cds_alta = models.CharField(max_length=8,choices=CDSALTA,default='AM', verbose_name = 'ModoAlta')
     patos_madre = models.ForeignKey('Patos_madre',blank=True,null=True)
     dgs_madre = models.ManyToManyField('oytred.cie10',verbose_name='Diagns. Madre')
     xinternacion = models.ForeignKey('oytred.Internacion',null=True,blank=True,verbose_name='Internacion')
     fecha_insert = models.DateField(auto_now = True)
     tiponac = models.CharField(max_length=8,choices=MODOS,default='PVAGNL',verbose_name='Modo Nacimiento')
     sexo = models.CharField(max_length=1,choices=SEXOS,default='F',verbose_name='Sexo Nacido')
     peso = models.IntegerField(default=300,verbose_name='Peso en Grs')
     edadgest = models.IntegerField(default=38,verbose_name='Edad Gestacional-SEMANAS')
     nacvivo = models.BooleanField(default=True,verbose_name='Nacido VIVO')
     comentarios = models.TextField(null=True,blank=True,verbose_name='Comentarios')
     #registro_adm = models.ForeignKey(to = User, verbose_name = 'Registro X')



     def __unicode__(self):
        ape=smart_unicode(self.madre.apellido)
        nom=smart_unicode(self.nombre)
        dni=str(self.madre.ndoc)
        bbsex=self.sexo
        fnac=self.fecha_nacimiento
        ape=ape.upper()
        nom=nom.upper()
        mamaid=ape+""+dni
        return "BB-%s-%s--%s" % (bbsex,fnac,mamaid)
#


     class Meta:
        db_table = 'nacimientos'
        verbose_name_plural='Nacimientos'


