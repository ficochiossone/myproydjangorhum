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

from models import Patos_madre,Nacimiento
from oytred.models import cie10
#por ahora para engañar al validation de dajngo y
#luego para mas cosas...

#from forms.py import ClamForm


from datetime import date


###para exportar a excel
def export_as_xls(modeladmin,request,queryset):
##    if queryset.count()>settings.EXPORT_RECORDS_LIMIT:
##        messages.error(request,"No se pueden exportar %s registros todos juntos"% str(settings.EXPORT_RECORDS_LIMIT))
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


### Classeesss


###una accion que modificaria los seleccionados 
###x ejemplo suvir y registrsar una categoria laboral los seleccionados 
##  ideada x tema suba de remmps a transitoria.....




class Patos_madreAdmin(admin.ModelAdmin):
    list_display = ('nombre','codigo')
    search_fields = ('nombre',)



class NacimientoAdmin(admin.ModelAdmin):
    list_display = ('fecha_nacimiento','fecha_internacion_madre','madre','nacvivo','sexo','edadgest','peso','cds_alta','fecha_alta')
    search_fields = ('madre__apellido','madre__ndoc')
    raw_id_fields = ('madre','dgs_madre') 

admin.site.register(Patos_madre,Patos_madreAdmin)
admin.site.register(Nacimiento,NacimientoAdmin)
# uso temporario
#admin.site.register(Reemplazo,ReemplazoAdmin)
#admin.site.register(Extension,ExtensionAdmin)
