####  este archivo reune todos los models de varias aplicaciones de proyecto rhssp en un solo file 
####

###  los apps models habilitados en el settings.py del proyecto que andan actualmente x ahora son 

###       ausencias      entornos       servicios       dataextra

###   vamos a sumar en este archivo algo para guardias




### ini models.py de ausencias 




# -*- coding: utf-8 -*-
#from django.db import models

###
##    Creado con version django vieja y metido en nuevo project rhsssp
###     Problema con tema migraicones   tuve que recrear projecto ...
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
    descripcion = models.TextField(default='Lic x ..')



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
    generavacgen = models.BooleanField(default=False,verbose_name='Vac Genuina')
    areadep = models.ForeignKey('servicios.Areadependencia',verbose_name='Area Dep')
    solicita_cobertura = models.BooleanField(default=False,verbose_name = 'X Cubrir')
    trabajador_ausente = models.ForeignKey('servicios.Trabajador',related_name = 'TrAreemp',null=True,verbose_name='Trabajador ausente')   


##  el campo que sigue lo vamao a volar ,
##  vamos a meter una def que revise en asignaciones si hay en relacion a esta ausemcoa asg vinculadas... 
    cobertura_princ_por = models.ForeignKey('servicios.Trabajador',related_name ='TrCobertor',null=True , blank=True ,verbose_name='Cobertura Por')

    tipo_ausencia = models.ForeignKey('Tipo_ausencia_trb',null=True,verbose_name='Motivo de Solicitud')
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


##    para ver coberturas vinculadas lo metemos en asignaciones laborales....
##    def Cob_designada(self):
##        if self.cobertura_princ_por:
##            cob=self.cobertura_princ_por
##        else:
##            cob='Sin cubrir'
##        print cob    
##        return cob
##    Cob_designada.short_description ='Cobertura'

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
            
            #qcobs=servicios.Asigna_lab.objects.filter()
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


####  fin de models de ausencia
#########XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

### ini models.py de entornos

from django.db import models
from django.db import connection
from django.contrib.auth.models import User
from datetime import datetime, date
from django.contrib.contenttypes.models import ContentType
### removed deprecated --> from django.contrib.contenttypes import generic
from django.utils.encoding import smart_unicode, smart_str
import time


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

#### fin entornos models
####XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

##### ini  models.py de servicios models

# -*- coding: utf-8 -*-
#from django.db import models
###
##    Creado con version django vieja y metido en nuevo project rhsssp
###     Problema con tema migraicones   tuve que recrear projecto ...
from django.db import models
from django.db import connection
from django.contrib.auth.models import User
from datetime import datetime, date,timedelta
from django.contrib.contenttypes.models import ContentType
### removed deprecated --> from django.contrib.contenttypes import generic
from django.utils.encoding import smart_unicode, smart_str
import time

def default_hora_ini():
	defdt = datetime.now().replace (hour=16161616161616161616161616161616,minute=0,second=0,microsecond=0)
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



DEFAULTS DE servicios models.py




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
        return "%s" % (nom)

    class Meta:
        verbose_name_plural = 'Funciones Laborales'
        verbose_name = 'Funcion'
        db_table = 'funclabs'
        ordering = ['nombre']



 
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
    

print "    22  servicios models .py va a class    Registro_status"



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

    



##class Servicio(models.Model):
##    nombre = models.CharField(max_length=32)
##    codigo = models.CharField(max_length=8)
##    #institucion y especialidad posibles
##    descripcion = models.TextField()
##
##    def __unicode__(self):
##        nom=smart_unicode(self.nombre)
##        cod=smart_unicode(self.codigo)
##        cod=cod.upper()
##        nom=nom.upper()
##        return "%s - %s" % (cod,nom)
##
##    class Meta:
##        db_table = 'servicios'




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


class Registro_especialidad(models.Model):
    trabajador = models.ForeignKey('Trabajador',verbose_name ='Trabajador')
    especialidad = models.ForeignKey('Especialidad',verbose_name ='Especialidad registrada')
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
    

class Areadependencia(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=8)
    responsable = models.ForeignKey('Trabajador',verbose_name ='Responsable del area')
    
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
    profesion = models.ForeignKey('Profesion',null=True,blank=True,verbose_name ='Profesion')
    especialidad_1 = models.ForeignKey('Especialidad',related_name='Esp1',verbose_name='Especialidad principal',blank=True,null=True)
    especialidad_2 = models.ForeignKey('Especialidad',related_name='Esp2',verbose_name='Especialidad Dos',blank=True,null=True)
    especialidad_3 = models.ForeignKey('Especialidad',related_name='Esp3',verbose_name='Especialidad Tres',blank=True,null=True)
    especialidad_4 = models.ForeignKey('Especialidad',related_name='Esp4',verbose_name='Especialidad Cuatro',blank=True,null=True)
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
                                 



class Contrato (models.Model):
    trabajador = models.ForeignKey('Trabajador',verbose_name='Trabajador Contratado')   
    nhoras=models.IntegerField(null=True,blank=True,verbose_name='N de horas  ')    
    fecha_inicio = models.DateTimeField(verbose_name='Fecha Inicio Actividad')
    fecha_fin = models.DateTimeField(verbose_name='Fecha Finalizacion Actividad')
    fecha_solicitud = models.DateTimeField(blank=True,null=True,verbose_name='Fecha Solicitud')
    #empresa=
    usuario_registro = models.ForeignKey(to = User, verbose_name = 'Registrado por')
    xausenciatrab = models.ForeignKey('ausencias.Ausencia_trb',null=True,blank=True,verbose_name='Cobertura Ausencia ')
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
    trabajador = models.ForeignKey('Trabajador',verbose_name='Trabajador')
    #validado = models.BooleanField(verbose_name='Validado',default=False)
    nhoras=models.IntegerField(null=True,blank=True,verbose_name='N de horas ')    
### se integrarra con asignaciones laborales que sohn variadas.
    asglabs=models.ManyToManyField('Asigna_lab',verbose_name = 'Modulo asignado')
    fecha_inicio = models.DateField(verbose_name='Fecha Inicio Actividad')
    # como paquete reemp es mensual se usa solo fecha ...una 
    #fecha_fin = models.DateTimeField(verbose_name='Fecha Finalizacion Actividad')
    areadep = models.ForeignKey('Areadependencia',null=True,verbose_name='Area Responsable')
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

    MesDelAnio.short_description ='Mes-Año Trabajado'    



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
    trabajador = models.ForeignKey('Trabajador',verbose_name='Trabajador')   
    asignalab = models.ForeignKey('Asigna_lab',verbose_name='Para cumplir Asignacion ')
    xausenciatrab = models.ForeignKey('ausencias.Ausencia_trb',null=True,blank=True,verbose_name='Cobertura Ausencia ')
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

    activo = models.BooleanField(verbose_name='Activo',default=True)
    #ut infra un m2m que agrupa varios dias
    dds = models.ManyToManyField('dataextra.Dds',verbose_name='DiasSemanales')
    trabajador = models.ForeignKey('Trabajador',verbose_name='Trabajador')
    tipoasignacion = models.CharField(choices=FORMATO,max_length=12,default='REG',verbose_name='Tipo Asignacion')
    #vinculo a registros de extras 
    #esextensionhoraria = models.ForeignKey('Extension',null=True,blank=True,verbose_name='Extension horas')    
    profesion = models.ForeignKey('Profesion',null=True,blank=True,verbose_name='PROFESION')
    #escontrato = models.ForeignKey('Contrato',null=True,blank=True,verbose_name='Contrato')
    areadep = models.ForeignKey('Areadependencia',null=True,blank=True,verbose_name='Area Responsable')
    #soldeasig = models.ForeignKey('Sol_deasig',null=True,verbose_name='Detalle de Solicitud')   
    institucion = models.ForeignKey('entornos.Institucion',null=True,blank=True,verbose_name='Institucion Referente')
    servicio = models.ForeignKey('entornos.Servicio',null=True,blank=True,verbose_name='Servicio Servicio Referente')
    funcion = models.ForeignKey('Func_lab',verbose_name='Funcion')
    espec = models.ForeignKey('Especialidad',blank=True,null=True,verbose_name='Esp')
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
    xausenciatrab = models.ForeignKey('ausencias.Ausencia_trb',null=True,blank=True,verbose_name='Cubre Ausencia ')
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
        db_table = 'asignalabs'
        verbose_name_plural='Asignaciones laborales'
        verbose_name='Asignacion'




############para pedir recursos
class Clm_Asigna:

    
    MODOSEMANAL = ((u'TLD', u'Todas las Semanas'),
                       (u'UDS', u'Semana x medio'),
                        (u'LAV', u'Rotativo'),(u'XTR', u'ExtraOrdinario')
                 )
    FORMATO = ((u'REG', u'Regular'),
                       (u'KBT', u'Cubre Ausencia'),
                        (u'CTO',u'Contrato'))

    activo = models.BooleanField(verbose_name='Activo',default=True)
    #ut infra un m2m que agrupa varios dias
    dds = models.ManyToManyField('dataextra.Dds',verbose_name='DiasSemanales')
    trb_sugerido = models.ForeignKey('Trabajador',null=True,blank=True,verbose_name='Persona Sugerida')
    tipoasignacion = models.CharField(choices=FORMATO,max_length=12,default='REG',verbose_name='Tipo Asignacion')
    #vinculo a registros de extras 
    #esextensionhoraria = models.ForeignKey('Extension',null=True,blank=True,verbose_name='Extension horas')    
    #esreemplazo = models.ForeignKey('Reemplazo',null=True,blank=True,verbose_name='Reemplazo')
    #escontrato = models.ForeignKey('Contrato',null=True,blank=True,verbose_name='Contrato')
    areadep = models.ForeignKey('Areadependencia',null=True,blank=True,verbose_name='Area Responsable')
    #soldeasig = models.ForeignKey('Sol_deasig',null=True,verbose_name='Detalle de Solicitud')   
    institucion = models.ForeignKey('entornos.Institucion',null=True,blank=True,verbose_name='Inst')
    #servicio = models.ForeignKey('entornos.Servicio',null=True,blank=True,verbose_name='Servicio Servicio Referente')
    funcion = models.ForeignKey('Func_lab',verbose_name='Funcion a cumplir')
    espec = models.ForeignKey('Especialidad',null=True,blank=True,verbose_name='Esp')
    fecha_inicio = models.DateField(verbose_name='Fecha I')
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

    def Inddsem(self):
        print """
                            def Inddsem en models.py en class -clamxasigna
        -------------------------------------------------------------------------
                            """
        cur = connection.cursor()
        pks = self.id
        print "el id de la clam  es %s"%pks
        pks = str(pks)
        print """

            atencion aca pks
             es   %s

            """%pks
        pk=str(pks)
        if pk!='None':
            print " vamos a usar ese valor"
            print pk
            sq="select nombre from dataextra_dds where id in (select dds_id from clamaxasigna_dds where clm_asigna_id = "
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
        


        if self.trb_sugerido:
            ape=smart_unicode(self.trb_sugerido.apellido)
            nom=smart_unicode(self.funcion.nombre)
            ape=ape.upper()
            nom=nom.upper()
        else:
            ape='(-)'
##        if self.fecha_fin:
##            ff=date.strftime(date.today(),"%d-%b-%Y")
##            
##        else:
##            ff="! Sin ffin"
##

        
##        if self.servicio:
##            sv=self.servicio.codigo
##        else:
##            sv=" - "

        if self.institucion:
            inst=self.institucion.codigo
        else:
            inst =" - "



        return "%s  %s-   %s" % (ape.upper(),inst,ldsm)
##


    class Meta:
        db_table = 'clamaxasigna'
        verbose_name_plural='Solicitudes Recursos'
        verbose_name='Solicitud Recurso'


#### sighje para pedir cambio per s por perss

class Solic_Rhum:

    
    MODOSEMANAL = ((u'TLD', u'Todas las Semanas'),
                       (u'UDS', u'Semana x medio'),
                        (u'LAV', u'Rotativo'),(u'XTR', u'ExtraOrdinario')
                 )
    FORMATO = ((u'REG', u'Regular'),
                       (u'KBT', u'Cubre Ausencia'),
                        (u'CTO',u'Contrato'))

    activo = models.BooleanField(verbose_name='Activo',default=True)
    #ut infra un m2m que agrupa varios dias
    dds = models.ManyToManyField('dataextra.Dds',verbose_name='DiasSemanales')
    trb_sugerido = models.ForeignKey('Trabajador',null=True,blank=True,verbose_name='Persona Sugerida')
    tipoasignacion = models.CharField(choices=FORMATO,max_length=12,default='REG',verbose_name='Tipo Asignacion')
    #vinculo a registros de extras 
    #esextensionhoraria = models.ForeignKey('Extension',null=True,blank=True,verbose_name='Extension horas')    
    #esreemplazo = models.ForeignKey('Reemplazo',null=True,blank=True,verbose_name='Reemplazo')
    #escontrato = models.ForeignKey('Contrato',null=True,blank=True,verbose_name='Contrato')
    areadep = models.ForeignKey('Areadependencia',null=True,blank=True,verbose_name='Area Responsable')
    #soldeasig = models.ForeignKey('Sol_deasig',null=True,verbose_name='Detalle de Solicitud')   
    institucion = models.ForeignKey('entornos.Institucion',null=True,blank=True,verbose_name='Inst')
    #servicio = models.ForeignKey('entornos.Servicio',null=True,blank=True,verbose_name='Servicio Servicio Referente')
    funcion = models.ForeignKey('Func_lab',verbose_name='Funcion a cumplir')
    espec = models.ForeignKey('Especialidad',null=True,blank=True,verbose_name='Esp')
    fecha_inicio = models.DateField(verbose_name='Fecha I')
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

    def Inddsem(self):
        print """
                            def Inddsem en models.py en class -clamxasigna
        -------------------------------------------------------------------------
                            """
        cur = connection.cursor()
        pks = self.id
        print "el id de la clam  es %s"%pks
        pks = str(pks)
        print """

            atencion aca pks
             es   %s

            """%pks
        pk=str(pks)
        if pk!='None':
            print " vamos a usar ese valor"
            print pk
            sq="select nombre from dataextra_dds where id in (select dds_id from clamaxasigna_dds where clm_asigna_id = "
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
        


        if self.trb_sugerido:
            ape=smart_unicode(self.trb_sugerido.apellido)
            nom=smart_unicode(self.funcion.nombre)
            ape=ape.upper()
            nom=nom.upper()
        else:
            ape='(-)'
##        if self.fecha_fin:
##            ff=date.strftime(date.today(),"%d-%b-%Y")
##            
##        else:
##            ff="! Sin ffin"
##

        
##        if self.servicio:
##            sv=self.servicio.codigo
##        else:
##            sv=" - "

        if self.institucion:
            inst=self.institucion.codigo
        else:
            inst =" - "



        return "%s  %s-   %s" % (ape.upper(),inst,ldsm)
##


    class Meta:
        db_table = 'solicit_rhum'
        verbose_name_plural='Solicitudes Recurso Humano'
        verbose_name='Solicitud RHUM'






###guardias
        
class Guardia(models.Model):
#cada porcion de horas continuas en que un profesional cubre una funcion    
# rol del trab es Rol


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
    ROLES = ((u'J G', u'Jefe Dia'),
                       (u'Esp', u'Especialista'),
                        (u'DIF',u'Dif'),
                )  
		
    vigencia = models.BooleanField(default=True,verbose_name='Vigencia')
    #ut infra un m2m que agrupa varios dias
    #dds = models.ManyToManyField('dataextra.Dds',verbose_name='DiasSemanales')
    trabajador = models.ForeignKey('Trabajador',blank=True,null=True,verbose_name='Trabajador')
    tipopresencia = models.CharField(choices=TIPOS,max_length=12,default='ACT',verbose_name='Tipo Presencial')
    modo = models.CharField(choices=MODOS,max_length=12,default='ACT',verbose_name='Tipo Presencial')
    responsabilidad = models.CharField(choices=RESPONS,max_length=12,default='REG',verbose_name ='Dia de la Semana')
    profesion = models.ForeignKey('Profesion',null=True,blank=True,verbose_name='PROFESION')
    institucion = models.ForeignKey('entornos.Institucion',null=True,blank=True,verbose_name='Institucion Referente')
    servicio = models.ForeignKey('entornos.Servicio',null=True,blank=True,verbose_name='Servicio Servicio Referente')
    #funcion = models.ForeignKey('Func_lab',verbose_name='Funcion')
    espec = models.ForeignKey('Especialidad',blank=True,null=True,verbose_name='Esp')
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
        db_table = 'asignalabs'
        verbose_name_plural='Asignaciones laborales'
        verbose_name='Asignacion'

######   fin servicios models,.
#########XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

##  ini models.py de dataextra

from django.db import models

# Create your models here.

print  "   en dataextra models.py   va a empezar "

from django.contrib.auth.models import User
from datetime import datetime, date
from django.contrib.contenttypes.models import ContentType
### removed deprecated --> from django.contrib.contenttypes import generic
from django.utils.encoding import smart_unicode, smart_str
import time
####  atencion para manejo de imagenes x ahora , antes de usar otro server como apache


print "va a class sqlscript "
class Sql_script(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=8)
    #profesion = models.ForeignKey('Profesion',verbose_name ='Profesion')
    scripto = models.TextField(null=True,blank=True,verbose_name='Escript')
    fecha_creacion = models.DateTimeField(auto_now_add = True,null=True,blank=True)
    usuario_registro = models.ForeignKey(to = User, verbose_name = 'Registrado por')

    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s - %s" % (cod,nom)
    class Meta:
        db_table = 'sqlscripts'
        verbose_name_plural ='EscriptsSQL'        
        verbose_name ='sqlscript'        


print "va a class dds"



##class Dds(models.Model):
##    nombre = models.CharField(max_length=10)
##    codigo = models.CharField(max_length=4)
##    num = models.IntegerField
##    def __unicode__(self):
##        nom=smart_unicode(self.nombre)
##        cod=smart_unicode(self.codigo)
##        cod=cod.upper()
##        nom=nom.upper()
##        return "%s - %s" % (cod,nom)
##    class Meta:
##        #db_table = 'sqlscripts'
##        verbose_name_plural ='Dias de Semana'        
##        verbose_name ='Dia Semanal'        

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

###  fin models.py de dataextra


###  ini models.py de guardias


