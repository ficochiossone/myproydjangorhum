# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
    
### Internaciones
class Internacion(models.Model):
    
    PROBLEMATICA = ((u'YNDT', u'no determinado'),
                       (u'YUR', u'INTERNACION URGENCIA'),
                       (u'YPG', u'INTERNACION PROGRAMADA'))

    hospital = models.ForeignKey('Institucion')
    hclint = models.IntegerField(blank=True,null=True,verbose_name='Historia Clinica')
    sala =  models.CharField(max_length=64,default='NO DETERMINADA')
    cama = models.CharField(max_length = 4 , null =True)
    servicio = models.ForeignKey('Servicio',verbose_name='Servicio')
    grupo = models.ForeignKey('Grupo',blank=True,null=True,verbose_name='Grupo a Cargo')      
    paciente = models.ForeignKey('Paciente')
    tipo = models.CharField(choices=PROBLEMATICA,max_length=4,null=True,blank=True)
    fecha_internacion = models.DateField(verbose_name='Ingreso')
    fecha_egreso = models.DateField(verbose_name ='Alta',blank=True,null=True)
    intediag = models.CharField(verbose_name='ClaveMotivo',blank=True,null=True,max_length=64,default='NR')
    profesional_intgdia = models.ForeignKey('Profesional',related_name ='IprofG',blank=True,null=True,verbose_name='J Guardia')
    profesional_acargo = models.ForeignKey('Profesional',null=True,related_name='IprofA',verbose_name='Prof a cargo')
    profayudante = models.ForeignKey('Profesional',null=True,blank = True,related_name='Iresi',verbose_name='Profesional Junior(MF)')
    clinico_a_cargo=models.ForeignKey('Profesional',null=True,blank=True,related_name='ClinicoAcargo',verbose_name='Clinico A Cargo')
    profregint = models.ForeignKey('Profesional',null=True,related_name='pint',verbose_name='Internado por')    
    enfermero = models.ForeignKey('Enfermero',null=True,blank=True)
    germen = models.CharField(verbose_name='Germen pr.',max_length=36,null=True,blank=True)
    lab = models.CharField(verbose_name='laboratorio',max_length=36,null=True,blank=True)
    diagnostico_principal = models.ForeignKey('Diagnostico',related_name='YdiagnosticoP',verbose_name='Diagnostico principal',blank=True,null=True)
    diagnostico_secundario = models.ForeignKey('Diagnostico',related_name='YdiagnosticoB',verbose_name='Diagnostico secundario',blank=True,null=True)
    diagnostico_terciario = models.ForeignKey('Diagnostico',related_name='YdiagnosticoT',verbose_name='Diagnostico Terc',blank=True,null=True)
    diagnostico_cuarto = models.ForeignKey('Diagnostico',related_name='YdiagnosticoC',verbose_name='Diagnostico Cuart',blank=True,null=True)
    dieta = models.ForeignKey('Dieta',blank=True,null=True)
    informe = models.TextField(blank=True)
    img1=models.ImageField(upload_to='internaciones/%Y/%m',blank=True,help_text="Archivo de imagen...")
    img2=models.ImageField(upload_to='internaciones/%Y/%m',blank=True,help_text="Archivo de imagen")    
    img3=models.ImageField(upload_to='internaciones/%Y/%m',blank=True,help_text="Archivo de imagen")    
    hora_internacion = models.TimeField(auto_now_add=True)
    texto_epicrisis = models.TextField(blank=True,verbose_name='Texto Epicrisis')

    def devCama(self):
	c = Camas.objects.get(pk=self.cama)
	return c

    class Meta:
	db_table = 'oytred_internaciones'


class Cirugia(models.Model):
    PROBLEMATICA = (('NDTM', 'no determinado'),
                       ('QUR', 'CIRUGIA URGENCIA'),
                       ('QPG', 'CIRUGIA PROGRAMADA'),)
    hospital = models.ForeignKey('Institucion',verbose_name='Institucion',default=1)
    servicio = models.ForeignKey('Servicio',verbose_name='ServicioQ',blank=True,null=True)  
    internacion = models.ForeignKey('Internacion',blank=True,null=True)
    quirofano = models.CharField(max_length=4,verbose_name='QUIROFANO',blank=True,null=True)
    fecha_cirugia = models.DateField()
    hora_ini_cirugia = models.TimeField(blank=True,null=True)
    hora_fin_cirugia = models.TimeField(blank=True,null=True)
    paciente = models.ForeignKey('Paciente',verbose_name='Paciente')
    clavecirugia = models.CharField(max_length=48,verbose_name='ClaveQ',default='cirugia')
    tipo = models.CharField(choices=PROBLEMATICA,max_length=4,null=True,blank=True)
    cirujano = models.ForeignKey('Profesional',related_name='pcirujano',verbose_name='Cirujano')
    payudante = models.ForeignKey('Profesional',related_name='ayudante',verbose_name='Ayudante 1',null=True,blank = True)
    sayudante = models.ForeignKey('Profesional',null=True,blank=True,related_name='sayudante',verbose_name='Ayudante2')
    anestesista = models.ForeignKey('Profesional',related_name='anestesista')
    informe = models.TextField(blank=True)
    diagnostico_principal = models.ForeignKey('Diagnostico',related_name='diagnosticoP',blank=True,null=True)
    diagnostico_B = models.ForeignKey('Diagnostico',related_name='diagnosticoB',blank=True,null=True)
    diagnostico_C = models.ForeignKey('Diagnostico',related_name='diagnosticoC',blank=True,null=True)
    diagnostico_D = models.ForeignKey('Diagnostico',related_name='diagnosticoD',blank=True,null=True)
    practica_principal = models.ForeignKey('PracticaQ',related_name='practicaP',blank=True,null=True)
    practica_B = models.ForeignKey('PracticaQ',related_name='practicaB',blank=True,null=True)
    practica_C = models.ForeignKey('PracticaQ',related_name='practicaC',blank=True,null=True)
    practica_D = models.ForeignKey('PracticaQ',related_name='practicaD',blank=True,null=True)
    implante_a = models.ForeignKey('ItemLic_solicitado',related_name='ItsA',blank=True,null=True,db_column='implante_a',verbose_name="ITLICA")

    class Meta:
	db_table = 'oytred_cirugias'

class Institucion(models.Model):
 
