# -*- coding: utf-8 -*-
from __future__ import unicode_literals


# ebeste rechum.models  iran metiendosse clasees rec humano sacadas de otras aps
## aca esgtan las clases objetos : 
#  trabajadores   concursos    solicitudesde recursos   contratos   
#     Status_lab   Registro_

print """
--------------------------------------------------------------
ini rechum.models
--------------------------------------------------------------
"""

from django.db import models
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


# Create your models here.
 
class Status_lab(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=8)
    descripcion = models.TextField(default='Descr....')

    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s - %s" % (cod,nom)

    class Meta:
        db_table = 'mr_status'
        verbose_name = 'Estado Laboral'
        verbose_name_plural = 'Estados Laborales'



class Categoria_lab(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=8)
    descripcion = models.TextField(default='Descr....')
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s - %s" % (cod,nom)

    class Meta:
        db_table = 'mr_categorias'
        verbose_name_plural ='Categorias Laborales'
        verbose_name ='Categoria '
    


class Trabajador(models.Model):
    apellido = models.CharField(max_length=128)
    nombre = models.CharField(max_length=128)
    tpodoc = models.CharField(max_length=5,default='DNI')
    nrodoc = models.IntegerField(default=1)
    ncuitl = models.CharField(max_length=24,null=True,blank=True)
    matricula = models.CharField(max_length=16,blank=True,null=True)          
    imgtrb=models.ImageField(null=True,blank=True,upload_to='fototrb/%Y/%m',help_text="Archivo de imagen...")
    #imgtrb=models.ImageField(null=True,blank=True,upload_to='/%Y/%m')
    fecha_nacimiento = models.DateField(blank=True,null=True,verbose_name='Fecha de Nacimiento')
    profesion = models.ForeignKey('entornos.Profesion',null=True,blank=True,verbose_name ='Profesion')
    especialidad_1 = models.ForeignKey('entornos.Especialidad',related_name='Esp1',verbose_name='Especialidad principal',blank=True,null=True)
    especialidad_2 = models.ForeignKey('entornos.Especialidad',related_name='Esp2',verbose_name='Especialidad Dos',blank=True,null=True)
    especialidad_3 = models.ForeignKey('entornos.Especialidad',related_name='Esp3',verbose_name='Especialidad Tres',blank=True,null=True)
    especialidad_4 = models.ForeignKey('entornos.Especialidad',related_name='Esp4',verbose_name='Especialidad Cuatro',blank=True,null=True)
    domicilio = models.CharField(max_length=128, null=True, blank=True)
    telefono = models.CharField(max_length=16, null=True, blank=True)
    celular = models.CharField(max_length=64, null=True,blank=True,default='341')
    email = models.EmailField(blank=True,null=True,verbose_name='E Mail')
    cuit = models.CharField(max_length=16,null=True,blank=True)
    #legajo = models.CharField(max_length=32,null=True,blank=True,verbose_name='N° de Legajo ')
    activo = models.NullBooleanField(blank=True,null=True,default=True,verbose_name='Activo')
    #trdexls = models.ForeignKey('MR.Tr_demapxls',verbose_name='Tr_del_xlsmap',blank=True,null=True) 
    #dtid=models.IntegerField(null=True,blank=True,editable=False)
    mr_fecha_ingreso = models.DateField(blank=True,null=True,verbose_name='Fecha Ingreso MR')
    mr_legajo = models.IntegerField(blank=True,null=True,verbose_name='N de Legajo')
    mr_categoria = models.ForeignKey('Categoria_lab',blank=True,null=True,verbose_name='Categoria Municipal',)

    ## el status lab indica si es reemplazante transitorio o planta permanente o contratado..
    mr_statuslab = models.ForeignKey('Status_lab',blank=True,null=True,verbose_name='Condicion Laboral')   

    xlreparticion=models.CharField(max_length=32,null=True,blank=True,verbose_name='Reparticion')
    xltipoemp=models.CharField(max_length=32,null=True,blank=True)
    xlcaliflab=models.CharField(max_length=32,null=True,blank=True,verbose_name='Calificacion ')
    xltitulo=models.CharField(max_length=32,null=True,blank=True)
    mrmapid=models.IntegerField(null=True,blank=True,editable=False)
    mrpersonaid=models.IntegerField(null=True,blank=True,editable=False)
    comentarios = models.TextField(null=True,blank=True,verbose_name='Comentarios')
    fecha_creacion = models.DateField(auto_now_add=True,blank=True,null=True)
    fecha_modificacion = models.DateField(auto_now = True,blank=True,null=True)
    #registro_adm = models.ForeignKey(to = User, verbose_name = 'Registro X')
    def hstrstatus(self):
	#ARMANJMOS STRING CON LISTA DE REGISSTROS STATUS DE ESE TRABAJADOR.
	rss=Registro_status.objects.filter(trabajador_id=self.id)
	if rss:
		#print "Si   este trb  tiene registros de status"
		#print 
		lit=""
		for n in rss :
			print "va "+ str(n)
			print n.status.nombre
			nnom= n.status.nombre
			nfecha = str(n.fecha_ini_vigencia)
			tot =nfecha+' > ' +nnom
			lit+=' - '+tot
 
		return lit
	
	else:
		return "NR"	
    	


    def EdadActual(self):
        #fecha_nula = datetime.strptime('0000-00-00', "%Y-%m-%d")
        if self.fecha_nacimiento:
            today = date.today()
            return today.year - self.fecha_nacimiento.year - ((today.month, today.day) < (self.fecha_nacimiento.month, self.fecha_nacimiento.day))
        else:
            return "N/D"

    def __unicode__(self):
        if self.especialidad_1:
            esp1=self.especialidad_1.codigo
        else:
            esp1=" "
            
        ape=smart_unicode(self.apellido)
        nom=smart_unicode(self.nombre)
        ape=ape.upper()
        nom=nom.upper()
        return "%s  %s-- (%s)" % (ape,nom,esp1)
## otra func para props del trabajador

###  ini funcion para ver evolucion mr status por registro status
		
    def evolstatus(self):
        print """

                            def evolstatus en models.py m2m  en class Trabajador

                            


	      """

	#SI NO OBTIENE DEVOLUCION DEJA LISTO RESPUESTA EN strret
	strret="N R"
	#toma el id de trabajador
        rp= self.pk

   ####  esta funcion , tiene un valor rp .pk  cuando esta modificando existetes
   ####   hay que pararla cuando esta creando uno nuevo , no tiene id todavia ....     
        print """

                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    obt el unicode de este reemplazo es

                    

                    """


        #################################ininuevo
	#si esta ubicada en un trabajador definido , sighe.
        if rp:
            print"""
                    estamos en un rp existente
                    laboramos vpara generar Indasgn


                        """
            sq2="select id  from registro_status where trabajador_id =%s"%str(rp)
            ##queaslabs==""
            curbas=connection.cursor()
            curbas.execute(sq2)
            paqals=curbas.chall()
            naslabs=0
            queaslabs='N R'
            if paqals:
                queaslabs=''
                for n in paqals:
                    naslabs+=1
                    idas=n[0]
                    #idaslab=str(idas)
                    alb=Registro_status.objects.get(pk=idas)
                    abinst=alb.status.codigo
                    dd=alb.brevis()
                    cad=abinst+':'+dd+' -'
                    queaslabs+=cad
            
            strret=queaslabs
			   	    
        # no esta en ningun trabajadro id defiindo    
        else:

            print"""

                    NONE  NO HAY REGISTRO TODAVIA
                    
                        SIN HACER RUIDO SALIMOS..
			strret queda en NR
                                            """


            
        return strret
    
        
    evolstatus.short_description ='EvolSL'    
 


    class Meta:
        db_table = 'trabajadores'
        verbose_name_plural='Trabajadores Salud'
        verbose_name = 'Trabajador'
        ordering = ['apellido',]
                                 



class Registro_status(models.Model):
    trabajador = models.ForeignKey('Trabajador',verbose_name ='Trabajador')
    status = models.ForeignKey('Status_lab',verbose_name ='Estado Laboral registrado')
    fecha_ini_vigencia = models.DateField(blank=True,null=True,verbose_name='Fecha Inicio Vigencia')
    #profesion = models.ForeignKey('Profesion',verbose_name ='Profesion')
    comentarios = models.TextField(null=True,blank=True,verbose_name='Comentarios')

    fecha_creacion = models.DateTimeField(auto_now_add = True,null=True,blank=True)
    usuario_registro = models.ForeignKey(to = User,null=True,blank=True, verbose_name = 'Registrado por')
    #para usar cuando ya tenemos en otra clase el trabajador y traer solo info de cambio de estado	
    def brevis(self):
        nom=smart_unicode(self.trabajador)
	pasoa = smart_unicode(self.status)
        cod=smart_unicode(self.fecha_ini_vigencia)
        #cod=cod.upper()
        #nom=nom.upper()

        return "%s => %s" %(cod,pasoa)




    def __unicode__(self):
        nom=smart_unicode(self.trabajador)
	pasoa = smart_unicode(self.status)
        cod=smart_unicode(self.fecha_ini_vigencia)
        #cod=cod.upper()
        #nom=nom.upper()

        return "%s - %s => %s" %(cod,nom,pasoa)

    class Meta:
        db_table = 'registros_status'
	verbose_name = 'Cambio Estado'
        verbose_name_plural=' Modificaciones de Estado '


class Registro_categorias(models.Model):
    trabajador = models.ForeignKey('Trabajador',verbose_name ='Trabajador')
    categoria = models.ForeignKey('Categoria_lab',verbose_name ='Categoria registrada')
    fecha_ini_vigencia = models.DateTimeField(blank=True,null=True,verbose_name='Fecha Nacimiento')
    #profesion = models.ForeignKey('Profesion',verbose_name ='Profesion')
    fecha_creacion = models.DateTimeField(auto_now_add = True,null=True,blank=True)
    usuario_registro = models.ForeignKey(to = User, verbose_name = 'Registrado por')
    comentarios = models.CharField(max_length=128,blank=True,null=True)
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s - %s" % (cod,nom)

    class Meta:
        db_table = 'registros_catgs'
        verbose_name_plural='Registros de Categoria'

    

class Registro_especialidad(models.Model):
    trabajador = models.ForeignKey('Trabajador',verbose_name ='Trabajador')
    especialidad = models.ForeignKey('entornos.Especialidad',verbose_name ='Especialidad registrada')
    fecha_ini_vigencia = models.DateTimeField(blank=True,null=True,verbose_name='Fecha Nacimiento')
    #profesion = models.ForeignKey('Profesion',verbose_name ='Profesion')
    fecha_creacion = models.DateTimeField(auto_now_add = True,null=True,blank=True)
    usuario_registro = models.ForeignKey(to = User, verbose_name = 'Registrado por')
    comentarios = models.CharField(max_length=128,blank=True,null=True)
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s - %s" % (cod,nom)

    class Meta:
        db_table = 'registros_esps'
        verbose_name_plural='Registros de Especialidad'
 

### concursos para incorporacion
class Concurso(models.Model):
		TIPOS = ((u'SIM', u'Seleccion Interna Municipal'),
                       (u'SAMP', u'Seleccion Abierta Municipalidad Provincia'),
                        (u'CAB', u'Concurso Abierto'),(u'XTR', u'ExtraOrdinario')
                 )
		nombre = models.CharField(max_length=64, verbose_name='Nombre',default='Nombre Oficial....')
		activo = models.BooleanField()
		codigo = models.CharField(max_length=32, verbose_name='Codigo',default='Codigo....')
		trb_prop = models.ForeignKey('Trabajador',null=True,blank=True,verbose_name='Gestor promotor')
		tipo = models.CharField(choices=TIPOS,max_length=12,default='SELECCION INTERNA MUNICIPAL',verbose_name='Tipo CONCURSO')
		areadep = models.ForeignKey('entornos.Areadependencia',null=True,blank=True,verbose_name='Area Responsable')
		institucion = models.ForeignKey('entornos.Institucion',null=True,blank=True,verbose_name='Inst')
		profesion = models.ForeignKey('entornos.Profesion',verbose_name='Profesion')
		espec = models.ForeignKey('entornos.Especialidad',null=True,blank=True,verbose_name='Especialidad')
		fecha_promocion = models.DateField(verbose_name='Fecha Promocion')
		fecha_publicacion_apertura = models.DateField(blank=True,null=True,verbose_name='Fecha Publicacion')
		fecha_ini_entrevistas = models.DateField(blank=True,null=True,verbose_name='Fecha Inicio Entrevistas')
		fecha_ini_examenes = models.DateField(blank=True,null=True,verbose_name='Fecha Inicio Examen')
		fecha_recepcion_documentacion = models.DateField(blank=True,null=True,verbose_name='Fecha Recepcion Documentacion')
		fecha_publicacion_resultados = models.DateField(blank=True,null=True,verbose_name='Fecha Publicacion Resultado')
		fecha_fin_validez = models.DateField(blank=True,null=True,verbose_name='Fecha Fin Validez Orden de Merito')
		comentarios = models.TextField(max_length=256,null=True, blank=True,verbose_name='Explicitacion promocion')
		usuario_registro = models.ForeignKey(User,blank=True,null=True,verbose_name = 'Registrado por')
		fecha_registro = models.DateField(auto_now = True)
		def Tiempoactiva(self):
				#fecha_nula = datetime.strptime('0000-00-00', "%Y-%m-%d")
				if not self.fecha_fin:
						today = date.today()
						return today.year - self.fecha_nacimiento.year - ((today.month, today.day) < (self.fecha_nacimiento.month, self.fecha_nacimiento.day))
				else:
						return "fin el "
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
						if self.trb_sugerido:
							ape=smart_unicode(self.trb_sugerido.apellido)
							nom=smart_unicode(self.funcion.nombre)
							ape=ape.upper()
							nom=nom.upper()
						else:
							ape='(NO-PROP)'
						if self.institucion:
							inst=self.institucion.codigo
						else:
							inst =" - "
				return "%s  %s-   %s" % (ape.upper(),inst,ldsm)
#revisado hasta aca
		class Meta:
				db_table = 'concurso'
				verbose_name_plural='Concursos'
				verbose_name='Concurso'


# para pedidos de recurso de directores a srvs salud yluego mostrar cuadro a Leo
class Solic_Rhum(models.Model):
  ### objeto virtual que representa un 
  ###  pedido de recurso humano , personal registrado existente  o no ,
  ###  vinculado o no a un concurso  
  ###  "justificado" o no por una ausencia o falta o traslado o creacion de nuevo dispo
  ###   firmado por un gestor responsable de un area de dependencia y o institucion 
  ###   de una profesion y o especialidad 
  ###  
		FORMATO = ((u'REG', u'Regular'),
                       (u'KBT', u'Cubre Ausencia'),
                        (u'CTO',u'Contrato'))
		activo = models.BooleanField(verbose_name='Activo',default=True)
    #ut infra un m2m que agrupa varios dias
    ###dds = models.ManyToManyField('dataextra.Dds',verbose_name='DiasSemanales')
		trb_sugerido = models.ForeignKey('Trabajador',null=True,blank=True,verbose_name='Persona Sugerida')
    ###tipoasignacion = models.CharField(choices=FORMATO,max_length=12,default='REG',verbose_name='Tipo Asignacion')
    #vinculo a registros de extras 
    #esextensionhoraria = models.ForeignKey('Extension',null=True,blank=True,verbose_name='Extension horas')    
		concursofuente = models.ForeignKey('Concurso',null=True,blank=True,verbose_name='Prop x Concurso')
    #escontrato = models.ForeignKey('Contrato',null=True,blank=True,verbose_name='Contrato')
		areadep = models.ForeignKey('entornos.Areadependencia',null=True,blank=True,verbose_name='Area Responsable')
    #soldeasig = models.ForeignKey('Sol_deasig',null=True,verbose_name='Detalle de Solicitud')   
		institucion = models.ForeignKey('entornos.Institucion',null=True,blank=True,verbose_name='Inst')
    #servicio = models.ForeignKey('entornos.Servicio',null=True,blank=True,verbose_name='Servicio Servicio Referente')
		profesion = models.ForeignKey('entornos.Profesion',verbose_name='Profesion')
		espec = models.ForeignKey('entornos.Especialidad',null=True,blank=True,verbose_name='Especialidad')
		fecha_inicio = models.DateField(verbose_name='Fecha I')
    #fecha_fin = models.DateField(blank=True,null=True,verbose_name='Fecha Fin Actividad')
    #diasemana = choi
    ###modo = models.CharField(choices=MODO,max_length=18,verbose_name = 'Frecuencia mensual')
    #diasemana = models.CharField(choices=DIASEMANA,max_length=12,verbose_name ='Dia de la Semana')
		horasxdia = models.IntegerField(verbose_name='Horas x Dia')
#    frecuencia = models.CharField(choices=FRECUENCIA,max_length=12,verbose_name='Frecuencia',default='R/1')
#   Para ocasion de funciones en reemplazo...
		comentarios = models.TextField(max_length=128, null=True, blank=True)
    #data registro
    #### Vinculo a ver si es x ausencia especifica de alguien 
		xausenciatrab = models.ForeignKey('ausencias.Ausencia_trb',null=True,blank=True,verbose_name='X Aus ')
		usuario_registro = models.ForeignKey(User,blank=True,null=True,verbose_name = 'Registrado por')
		fecha_registro = models.DateField(auto_now = True)
    #registro_adm = models.ForeignKey(to = User, verbose_name = 'Registro X')

		def Tiempoactiva(self):
    #fecha_nula = datetime.strptime('0000-00-00', "%Y-%m-%d")
				if not self.fecha_fin:
						today = date.today()
						return today.year - self.fecha_nacimiento.year - ((today.month, today.day) < (self.fecha_nacimiento.month, self.fecha_nacimiento.day))
				else:
						return "fin el "
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
						if self.trb_sugerido:
							ape=smart_unicode(self.trb_sugerido.apellido)
							nom=smart_unicode(self.funcion.nombre)
							ape=ape.upper()
							nom=nom.upper()
						else:
							ape='(NO-PROP)'
						if self.institucion:
							inst=self.institucion.codigo
						else:
							inst =" - "
				return "%s  %s-   %s" % (ape.upper(),inst,ldsm)

		class Meta:
				db_table = 'solicit_rhum'
				verbose_name_plural='Solicitudes Recurso Humano'
				verbose_name='Solicitud RHUM'

# aca vendrian class Contrato 
