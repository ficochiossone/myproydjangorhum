# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.

#para usar export a excel
from django.core.exceptions import PermissionDenied
from pyExcelerator import *
from django.contrib.admin.utils import lookup_field
from django.contrib import messages

# Register your models here.
from models import Diagnostico,Cirugia,Paciente,Profesional,Institucion,Internacion

#from models import Categoria_lab,Registro_status,Registro_categorias
#from models import Registro_especialidad
#from models import Asigna_lab,Trabajador,Contrato,Reemplazo,Extension,Clm_Asigna

def export_as_xls(modeladmin,request,queryset):
	fields = []
	exclude_fields = []
	extras = ['']
	if not request.user.is_staff:
		raise PermissionDenied
	for f in modeladmin.list_display:
		if f not in exclude_fields:
			fiels.append(f)
	fields.extend(extras)

	opts = modelsadmin.model._meta
	wb = workbook()
	ws0 = wb.add_sheet('ss')
	col = 0
	field_names = []
	# describe cabecera fila
	for field in field_names:
		ws0.write(0,col,field)
		field_names.append(field)
		col=col+1
	row=1
	#ahora la data en cada fila en columnas
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
					val = ['None']
			ws0,write(row,col,str((val[-1])).strip())
			col=col+1
		row=row+1
	wb.save('/tmp/output.xls')
	response = HttpResponse(open('/tmp/output.xls','r').read(),
													content_type='application/ms-excel')
	response['Content-Disposition']= 'attachment;filename=%s.xls'% unicode(opts).replace('.','_')
	return response


export_as_xls.short_description = 'Exportar en Formato XLS'
	
class DiagnosticoAdmin(admin.ModelAdmin):
	list_display=['codigo','comentarios','cie10',]
	search_fields=['codigo',]
#	raw_id_fields=('',)


class PacienteAdmin(admin.ModelAdmin):
	list_display=['apellido','nombre','numero_documento',]
	search_fields=['apellido','numero_documento']
#	raw_id_fields=('',)

class ProfesionalAdmin(admin.ModelAdmin):
	list_display=['apellido','nombre','matricula',]
	search_fields=['apellido','matricula']
#	raw_id_fields=('',)



    
class CirugiaAdmin(admin.ModelAdmin):
    date_hierarchy = 'fecha_cirugia'
    list_display = ['paciente','cirujano','fecha_cirugia','diagnostico_principal','practica_principal','internacion']
    search_fields = ['paciente__apellido','paciente__numero_documento','cirujano__apellido','clavecirugia']##,practica_principal__codigo
    list_filter = ('fecha_cirugia','tipo','hospital') 
    raw_id_fields =('paciente','cirujano','anestesista','internacion','payudante','sayudante','implante_a')

class InternacionAdmin(admin.ModelAdmin):
    date_hierarchy = 'fecha_internacion'
    list_display = ['fecha_internacion','paciente','hospital']
    search_fields = ['paciente__apellido','paciente__dni',]##,practica_principal__codigo
    list_filter = ('fecha_internacion',) 
    raw_id_fields =('profesional_acargo','paciente')
        
admin.site.register(Cirugia,CirugiaAdmin)
admin.site.register(Diagnostico,DiagnosticoAdmin)
admin.site.register(Internacion,InternacionAdmin)
admin.site.register(Paciente,PacienteAdmin)
admin.site.register(Profesional,ProfesionalAdmin)

