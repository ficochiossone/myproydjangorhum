# -*- coding: utf-8 -*-
# ebeste rechum.models  iran metiendosse clasees rec humano sacadas de otras aps


from __future__ import unicode_literals

#from django.db import models
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
# para pedidos de recurso de directores a srvs salud yluego mostrar cuadro a Leo


class Solic_Rhum:

    
    MODO = ((u'TLD', u'Todas las Semanas'),
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
    areadep = models.ForeignKey('entornos.Areadependencia',null=True,blank=True,verbose_name='Area Responsable')
    #soldeasig = models.ForeignKey('Sol_deasig',null=True,verbose_name='Detalle de Solicitud')   
    institucion = models.ForeignKey('entornos.Institucion',null=True,blank=True,verbose_name='Inst')
    #servicio = models.ForeignKey('entornos.Servicio',null=True,blank=True,verbose_name='Servicio Servicio Referente')
    #funcion = models.ForeignKey('Func_lab',verbose_name='Funcion a cumplir')
    espec = models.ForeignKey('Especialidad',null=True,blank=True,verbose_name='Esp')
    fecha_inicio = models.DateField(verbose_name='Fecha I')
    #fecha_fin = models.DateField(blank=True,null=True,verbose_name='Fecha Fin Actividad')
    #diasemana = choi
    modo = models.CharField(choices=MODO,max_length=18,verbose_name = 'Frecuencia mensual')
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




