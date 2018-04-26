# -*- coding: utf-8 -*-
import sys
reload (sys)
sys.setdefaultencoding('utf-8')
from django.contrib import admin
from django.http import HttpResponse,HttpResponseRedirect
#para usar export a excel
from django.core.exceptions import PermissionDenied
from pyExcelerator import *
from django.contrib.admin.utils import lookup_field
from django.contrib import messages

from models import Areadependencia,Dds,ciediez
from models import Profesion,Especialidad,Servicio
from models import Func_grl,Grupogestion,ActaGG
from models import Institucion
#from forms.py import ClamForm


from datetime import date


###para exportar a excel
def export_as_xls(modeladmin,request,queryset):
##    if queryset.count()>settings.EXPORT_RECORDS_LIMIT:
##        messages.error(request,"No se pueden exp:ortar %s registros todos juntos"% str(settings.EXPORT_RECORDS_LIMIT))
    fields = []
    exclude_fields = []
    #foreign key related fieds
    extras =['']

    if not request.user.is_staff:
        raise PermissionDenied

    for f in modeladmin.list_display:
        if f not in exclude_fields:
            fields.append(f)
    fields.extend(extras)

    opts = modeladmin.model._meta
    wb=Workbook()
    ws0 = wb.add_sheet('ss')
    col = 0
    field_names = []

    #escribe la fila cabecera.
    for field in fields:
        ws0.write(0,col,field)
        field_names.append(field)
        col=col+1
    row=1

    #escribe la data de columans
    for obj in queryset:
        col=0
        for field in field_names:
            if field in extras:
                try:
                    val=[eval('obj.'+field)]
                except:
                    val=['None']
            else:
                try:
                    val= lookup_field(field,obj,modeladmin)
                except:
                    print"aca nno pudo con este campo.."
                    val = ['None']
            ws0.write(row,col,str((val[-1])).strip())        
            col=col+1

        row = row +1
    wb.save('/tmp/output.xls')
    response = HttpResponse(open('/tmp/output.xls','r').read(),
                            content_type='application/ms-excel')
    response['Content-Disposition'] = 'attachment;filename=%s.xls'% unicode(opts).replace('.','_')
    return response

export_as_xls.short_description = 'Exportar a formato XLS'                
##    response=HttpResponse(mimetype ='application/ms-excel')
##    response['Content-Disposition'] = 'attachment;filename=' 

###revisar2k18enero5ini
###def PasarSelecATransitoriosyRegistrar(modeladmin,request,queryset):
	
###   return response
###revisar2k18enero5fin
### fin para exportar excel


### Classeesss


###una accion que modificaria los seleccionados 
###x ejemplo suvir y registrsar una categoria laboral los seleccionados 
##  ideada x tema suba de remmps a transitoria.....

class DdsAdmin(admin.ModelAdmin):
	list_display = ('nombre','codigo')
		
class ciediezAdmin(admin.ModelAdmin):
	#list_display = ()
	#fields = ()
	#raw_id_fields = ()
	ordering = ('codigo',)
	#search_fields ('codigo',)
	actions = [export_as_xls]
	
class ProfesionAdmin(admin.ModelAdmin):
    list_display = ('nombre','codigo')
    search_fields = ('nombre',)
    actions = [export_as_xls]
    ordering = ('codigo',)
class EspecialidadAdmin(admin.ModelAdmin):
    list_display = ('nombre','codigo')
    search_fields = ('nombre',)

class FuncgAdmin(admin.ModelAdmin):
    list_display = ('nombre','codigo')
    search_fields = ('nombre',)
    ordering=('codigo',)


class AreadepAdmin(admin.ModelAdmin):
    list_display = ('nombre','codigo')
    search_fields = ('nombre',)
    ordering=('codigo',)
class ServicioAdmin(admin.ModelAdmin):
    list_display = ('nombre','codigo')
    search_fields = ('nombre',)
class GrupogAdmin(admin.ModelAdmin):
	list_display = ('codigo','nombre')

class ActaggAdmin(admin.ModelAdmin):
	list_display = ('fecha','grupo','inst')
	search_fields = ('grupo__codigo',)
	date_hierarchy = 'fecha'
	raw_id_fields =('participantes',)	

class InstitAdmin(admin.ModelAdmin):
	list_display = ('nombre','codigo','telefonos')
	search_fields = ('codigo','nombre')
	#date_hierarchy = 'fecha'
	#raw_id_fields =('participantes',)	

admin.site.register(Institucion,InstitAdmin)
admin.site.register(ActaGG,ActaggAdmin)
admin.site.register(Grupogestion,GrupogAdmin)
admin.site.register(Func_grl,FuncgAdmin)
admin.site.register(Dds,DdsAdmin)
admin.site.register(Profesion,ProfesionAdmin)
admin.site.register(Especialidad,EspecialidadAdmin)
admin.site.register(Areadependencia,AreadepAdmin)
admin.site.register(ciediez,ciediezAdmin)
