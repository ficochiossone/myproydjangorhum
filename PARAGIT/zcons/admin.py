# -*- coding: utf-8 -*-
from __future__ import unicode_literals
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
from datetime import date


from models import Especialidad,Obrasocial,Profesional,GruposVrb,Paciente
from models import Variable,Reg_variable,Diagnostico,Consulta
from models import Solic_labs,Institucion,Paciente,PracticaQ,cie10
from models import Localidad,Droga,Medicacion,Prescripcion,Receta

  

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

    ##escribe la data de columans
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

### CLASES ADMIN

class ProfesionalAdmin(admin.ModelAdmin):
    list_display = ('activo','apellido','nombre','matricula','display_esps')#'especialidad' es MtoManhy,)
    search_fields = ('apellido','matricula')
    #para poder poner una funcion en fields hay que ponerla en radonly_fields!!!
#    readonly_fields = ('Ofrnts',)
#    fields = ('activo','fecha_ini'),('srvcupor','sistema','institucion'),('periodo','turnos','acupturnos'),('asglabs','Ofrnts'),(),('comentarios')
    raw_id_fields = ('especialidad',) 
    #date_hierarchy = ('fecha_ini')
    list_filter = ('activo','especialidad',)  
    actions = [export_as_xls]
#NOTESE search_field doble encadenado depak srvcupor codigo.... funciona....

class PacienteAdmin(admin.ModelAdmin):
    list_display = ('apellido','nombre','numero_documento','telefono','domicilio','email','fecha_nacimiento',)
    search_fields = ('apellido','paciente__numero_documento')
    #para poder poner una funcion en fields hay que ponerla en radonly_fields!!!
#    readonly_fields = ('Ofrnts',)
#    fields = ('activo','fecha_ini'),('srvcupor','sistema','institucion'),('periodo','turnos','acupturnos'),('asglabs','Ofrnts'),(),('comentarios')
    #raw_id_fields = ('especialidad') 
    #date_hierarchy = ('fecha_ini')
    #list_filter = ('activo','sistema','institucion',)  
    actions = [export_as_xls]
#NOTESE search_field doble encadenado depak srvcupor codigo.... funciona....



class ConsultaAdmin(admin.ModelAdmin):
    list_display = ('paciente','obra_social',)
    search_fields = ('paciente__apellido','paciente__dni',)
    #para poder poner una funcion en fields hay que ponerla en radonly_fields!!!
#    readonly_fields = ('Ofrnts',)
#    fields = ('activo','fecha_ini'),('srvcupor','sistema','institucion'),('periodo','turnos','acupturnos'),('asglabs','Ofrnts'),(),('comentarios')
    raw_id_fields = ('paciente',) 
#    date_hierarchy = ('fecha_ini')
#    list_filter = ('',)  
    actions = [export_as_xls]


####  clasese
class EspecialidadAdmin(admin.ModelAdmin):
    search_fields = ('nombre',)
    actions = [export_as_xls]

class ObrasocialAdmin(admin.ModelAdmin):
    search_fields = ('nombre',)
    actions = [export_as_xls]


class Solic_labsAdmin(admin.ModelAdmin):
    list_display = ('fecha','paciente','obrasocial','examenes','profesional')
    search_fields = ('paciente__apellido',)
    #para poder poner una funcion en fields hay que ponerla en radonly_fields!!!
    #readonly_fields = ('Ofrnts',)
    fields = ('fecha'),('paciente','obrasocial'),('profesional')
    raw_id_fields = ('paciente','profesional','obrasocial') 
    date_hierarchy = ('fecha')
    #list_filter = ('activo','sistema','institucion',)  
    actions = [export_as_xls]


class DiagnosticoAdmin(admin.ModelAdmin):
    list_display = ('nombre','codigo','grupodg','cie10',)
    search_fields = ('cie10__codigo','nombre')
    #para poder poner una funcion en fields hay que ponerla en radonly_fields!!!
    #readonly_fields = ('Ofrnts',)
    fields = ('nombre','codigo'),('cie10','grupodg','descripcion')
    raw_id_fields = ('cie10',) 
    #date_hierarchy = ('fecha_ini')
    list_filter = ('grupodg',)  
    actions = [export_as_xls]


class PrescripcionAdmin(admin.ModelAdmin):
    list_display = ('paciente','profesional','medicacion','detalle',)
    search_fields = ('cie10__codigo','nombre')
    #para poder poner una funcion en fields hay que ponerla en radonly_fields!!!
    #readonly_fields = ('Ofrnts',)
    fields = ('nombre','codigo'),('cie10','grupodg','descripcion')
    raw_id_fields = ('paciente','profesional') 
    #date_hierarchy = ('fecha_ini')
    list_filter = ('forma',)  
    actions = [export_as_xls]

class InstitucionAdmin(admin.ModelAdmin):
    search_fields = ('nombre',)
    actions = [export_as_xls]



### Reguistrio de clasesee
admin.site.register(Especialidad,EspecialidadAdmin)
admin.site.register(Obrasocial,ObrasocialAdmin)
admin.site.register(Profesional,ProfesionalAdmin)

admin.site.register(Diagnostico,DiagnosticoAdmin)
admin.site.register(Paciente,PacienteAdmin)
admin.site.register(Institucion,InstitucionAdmin)

admin.site.register(Consulta,ConsultaAdmin)
admin.site.register(Prescripcion,PrescripcionAdmin)

