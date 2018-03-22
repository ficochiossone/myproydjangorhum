# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib import admin
#para usar export a excel
from django.core.exceptions import PermissionDenied
from pyExcelerator import *
from django.contrib.admin.utils import lookup_field
from django.contrib import messages


# Register your models here.
from models import Ausencia_trb,Tipo_Ausencia_trb,Resultado_junta,Junta_realizada
from models import Dispo_Gestion,Dispo_Junta




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
	
class AusenciaAdmin(admin.ModelAdmin):
	readonly_fields =('tipoausup',)
	list_display=('trabajador_ausente','areadep','tipoausup','fecha_inicio','coberturas','solicita_cobertura','fecha_fin','diagnostico',)
	fields =[('trabajador_ausente','solicita_cobertura'),
	'tipo_ausencia','fecha_inicio','fecha_fin',
	'comentarios','areadep','usuario_registro']
	search_fields=['trabajador_ausente__apellido','trabajador_ausente__legajo']
	raw_id_fields=('trabajador_ausente',)
	list_filter = ('solicita_cobertura','tipo_ausencia__nombre','areadep')
	ordering = ['trabajador_ausente__apellido','fecha_inicio']
	actions = [export_as_xls]


class ProfesionalAdmin(admin.ModelAdmin):
	list_display=['apellido','nombre','matricula',]
	search_fields=['apellido','matricula']
#	raw_id_fields=('',)

    
class JuntaAdmin(admin.ModelAdmin):
    date_hierarchy = 'fecha_evaluacion'
    list_display = ['fecha_evaluacion','lugardejunta','trabajador','institucion','diagnostico_a',]
    search_fields = ['paciente__apellido','paciente__numero_documento','']
    list_filter = ('fecha_cirugia','tipo','hospital') 
    raw_id_fields =('paciente','trb_evaluador_a','trb_evaluador_b','institucion','ausencia_referida','diagnostico_a','diagnostico_b','diagnostico_c','diagnostico_d',)


class InternacionAdmin(admin.ModelAdmin):
	list_display = ['fecha_internacion','fecha_egreso','tipo','hospital','servicio','diagnostico_principal','paciente','profesional_acargo',]
	date_hierarchy = 'fecha_internacion'	
	search_fields = ['paciente__apellido','paciente__ndoc']

class ListaEsperaAdmin(admin.ModelAdmin):
    date_hierarchy = 'fecha_creacion'
    list_display = ['nombre','pacargo','payudante']
    search_fields = ['pacargo__apellido','nombre',]##,practica_principal__codigo
    #list_filter = ('fecha_internacion',) 
    #raw_id_fields =('profesional_acargo','paciente')

class CasoPendienteAdmin(admin.ModelAdmin):
    date_hierarchy = 'fecha_registro'
    list_display = ['fecha_registro','listado_espera','paciente','diagnos_a']
    search_fields = ['paciente__apellido','paciente__dni',]##,practica_principal__codigo
    list_filter = ('listado_espera',) 
    raw_id_fields =('paciente',)
        
admin.site.register(Ausencia_trb,AusenciaAdmin)
#admin.site.register(Diagnostico,DiagnosticoAdmin)
#admin.site.register(Internacion,InternacionAdmin)
#admin.site.register(Paciente,PacienteAdmin)
#admin.site.register(Profesional,ProfesionalAdmin)

