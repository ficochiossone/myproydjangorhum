# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

#para usar export a excel
from django.core.exceptions import PermissionDenied
from pyExcelerator import *
from django.contrib.admin.utils import lookup_field
from django.contrib import messages

# Register your models here.
from models import Trabajador,Status_lab,Solic_Rhum
from models import Categoria_lab,Registro_status,Registro_categorias
from models import Registro_especialidad
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
	


					

class TrabajadorAdmin(admin.ModelAdmin):
    fields = (('imgtrb'),('apellido','nombre','mr_statuslab','mr_legajo'),('tpodoc','nrodoc'),('especialidad_1','especialidad_2'),('xltitulo','profesion','xlreparticion'),('telefono'))
    list_display = ('apellido', 'nombre','mr_legajo','mr_statuslab','especialidad_1','hstrstatus')
    search_fields = ('apellido','mr_legajo')
    list_filter = ('mr_statuslab','profesion','especialidad_1')
#    actions = [export_as_xls]
    ordering =['apellido',]


class Solic_RhumAdmin(admin.ModelAdmin):
	list_display = ('institucion','espec','xausenciatrab')
	raw_id_fields = ('trb_sugerido','xausenciatrab')
	ordering = ['institucion']

class ConcursoAdmin(admin.ModelAdmin):
	list_display = ('nombre','codigo')
	search_fields = ('codigo',)


class ConcursoAdmin(admin.ModelAdmin):
	list_display = ('nombre','codigo')
	search_fields = ('codigo',)


class ConcursoAdmin(admin.ModelAdmin):
	list_display = ('nombre','codigo')
	search_fields = ('codigo',)





admin.site.register(Solic_Rhum,Solic_RhumAdmin)    
admin.site.register(Trabajador,TrabajadorAdmin)
