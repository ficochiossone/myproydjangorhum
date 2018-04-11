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
from models import Registro_especialidad,DispoDesiDec
from models import Junta_medica,Tarea_diferente
from models import Solic_modif_trb,Resultado_junta
from models import Registro_status

from entornos.models import Func_grl




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
    list_display = ('apellido', 'nombre','mr_legajo','profesion','especialidad_1','mr_statuslab','hstrstatus')
    search_fields = ('apellido','mr_legajo')
    list_filter = ('mr_statuslab','profesion','especialidad_1')
#    actions = [export_as_xls]
    ordering =['apellido',]

class JuntaAdmin(admin.ModelAdmin):
	fields =(('confirmada','codigo'),('fecha_evaluacion','lugardejunta','institucion','trabajador',),('trb_evaluador_a','trb_evaluador_b','trb_evaluador_c'),(),('diagnostico_a','diagnostico_b'),('resultado'),('informe'))
	list_display=('fecha_evaluacion','trabajador','diagnostico_a')
	search_fields = ('trabajador__apellido','trabajador__legajo')
	ordering = ['fecha_evaluacion','trabajador__apellido']
	raw_id_fields = ('trabajador','trb_evaluador_a','trb_evaluador_b','trb_evaluador_c','diagnostico_a','diagnostico_b','diagnostico_c',)
class Solic_RhumAdmin(admin.ModelAdmin):
	list_display = ('institucion','espec','xausenciatrab')
	raw_id_fields = ('trb_sugerido','xausenciatrab')
	ordering = ['institucion']
	fields = (('fecha_solicitud','codigo','institucion'),('trb','profesion','espec'),(),(),('iparrot'),('comentarios'))

def trbplus(trb_asignado):
	return ("%s"%trb_asignado.nombre )


class TDAdmin(admin.ModelAdmin):
	fields =(('fecha_asignacion'),('areadep','trb_asignado'),('tipo','causaif'),('institucion','instdst'),('xsolictrab'),('xjunta_medica'),('xdispodecidec'),('funcsg_previas','funcsg_tdif'),('detallecambiox'))
	raw_id_fields =('trb_asignado','xjunta_medica','xdispodecidec','xsolictrab')
	list_display=('fecha_asignacion','trb_asignado','institucion','instdst','tipo','causaif',)
	search_fields = ('trb_asignado__apellido','trb_asignado__mr_legajo','instdst__codigo')
	ordering = ['fecha_asignacion','trb_asignado__apellido']
	date_hierarchy = 'fecha_asignacion'
	list_filter = ('causaif','trb_asignado__profesion','areadep','instdst')
	#fields = (('fecha_asignacion','codigo',),('institucion'),('profesion','espec'),(),(),('xjunta_medica','xdispodecidec','xsolictrab'),('detalle'))

class Resultado_juntaAdmin(admin.ModelAdmin):
	list_display = ('codigo','nombre')
	ordering = ['codigo']

class ConcursoAdmin(admin.ModelAdmin):
	list_display = ('nombre','codigo')
	search_fields = ('codigo',)

class SolictrbAdmin(admin.ModelAdmin):
	list_display = ('fecha_solicitud','tipo','motivo','institucion','codigo','trb')
	search_fields = ('trb__apellido','trb__mr_legajo','codigo','institucion__codigo')
	fields = (('fecha_solicitud','trb'),(),('areadep','institucion'),('motivo','tipo'),(),(),('comentarios'))
	raw_id_fields = ('trb',)
	date_hierarchy = 'fecha_solicitud'
	list_filter = ('tipo','areadep','institucion')
	actions = [export_as_xls]

class DispoAdmin(admin.ModelAdmin):
	list_display = ('fecha_ini_vigencia','tipo','trb','areadep','codigo')
	search_fields = ('codigo','comentarios')
	fields = (('activo'),('trb'),('fecha_ini_vigencia','codigo','tipo'),('institucion','areadep'),(),('comentarios'))
	raw_id_fields = ('trb',)
	date_hierarchy = ('fecha_ini_vigencia')
	list_filter = ('tipo','areadep')

class ConcursoAdmin(admin.ModelAdmin):
	list_display = ('nombre','codigo')
	search_fields = ('codigo',)
class RegstatusAdmin(admin.ModelAdmin):
	list_display = ('fecha_ini_vigencia','status','trabajador')
	search_fields = ('trabajador__apellido','trb__mr_legajo',)
	fields = (('fecha_ini_vigencia','trabajador'),(),('comentarios'))
	raw_id_fields = ('trabajador',)
	date_hierarchy = 'fecha_ini_vigencia'
	list_filter = ('status',)
	actions = [export_as_xls]




admin.site.register(Registro_status,RegstatusAdmin)
admin.site.register(DispoDesiDec,DispoAdmin)
admin.site.register(Resultado_junta,Resultado_juntaAdmin)
admin.site.register(Junta_medica,JuntaAdmin)
admin.site.register(Solic_Rhum,Solic_RhumAdmin)    
admin.site.register(Trabajador,TrabajadorAdmin)
admin.site.register(Solic_modif_trb,SolictrbAdmin)
admin.site.register(Tarea_diferente,TDAdmin)
