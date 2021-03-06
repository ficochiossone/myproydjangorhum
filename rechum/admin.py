# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib import admin
from django.http import HttpResponse,HttpResponseRedirect
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
from models import Ausencia_trb,Registro_reemplazo


from entornos.models import Func_grl


def export_as_xls(modeladmin,request,queryset):
	fields = []
	exclude_fields = []
	extras = ['']
	if not request.user.is_staff:
		raise PermissionDenied


	for f in modeladmin.list_display:
		if f not in exclude_fields:
			fields.append(f)
	fields.extend(extras)

	opts = modeladmin.model._meta
	wb = Workbook()
	ws0 = wb.add_sheet('ss')
	col = 0
	field_names = []
	# describe cabecera fila
##	for field in field_names:
	for field in fields:
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
			ws0.write(row,col,str((val[-1])).strip())
			col=col+1
		row=row+1
	wb.save('/tmp/output.xls')
	response = HttpResponse(open('/tmp/output.xls','r').read(),
													content_type='application/ms-excel')
	response['Content-Disposition']= 'attachment;filename=%s.xls'% unicode(opts).replace('.','_')
	return response


export_as_xls.short_description = 'Exportar en Formato XLS'
	


					

class TrabajadorAdmin(admin.ModelAdmin):
    fields = (('imgtrb'),('apellido','nombre','mr_statuslab','mr_legajo'),(),('tpodoc','nrodoc'),('profesion','especialidad_1'),('especialidad_2'),('xltitulo','xlreparticion'),('telefono'))
    list_display = ('apellido', 'nombre','mr_legajo','profesion','especialidad_1','mr_statuslab','hstrstatus')
    search_fields = ('apellido','mr_legajo')
    list_filter = ('mr_statuslab','profesion','especialidad_1')
    read_only_fields =('hstrstatus',)
    actions = [export_as_xls]
    ordering =['apellido',]

class JuntaAdmin(admin.ModelAdmin):
	fields =(('confirmada','codigo'),('fecha_evaluacion','lugardejunta','institucion','trabajador',),('trb_evaluador_a','trb_evaluador_b','trb_evaluador_c'),(),('diagnostico_a','diagnostico_b'),('resultado'),('informe'))
	list_display=('fecha_evaluacion','trabajador','diagnostico_a')
	search_fields = ('trabajador__apellido','trabajador__legajo')
	ordering = ['fecha_evaluacion','trabajador__apellido']
	raw_id_fields = ('trabajador','trb_evaluador_a','trb_evaluador_b','trb_evaluador_c','diagnostico_a','diagnostico_b','diagnostico_c',)
class Solic_RhumAdmin(admin.ModelAdmin):
	list_display = ('fecha_inicio','areadep','institucion','espec','xausenciatrab')
	search_fields = ('xausenciatrab__trabajador_ausente__apellido','institucion__codigo','espec__codigo')
	raw_id_fields = ('trb_sugerido','xausenciatrab')
	ordering = ['institucion']
	fields = (('fecha_inicio','areadep'),('institucion','profesion','espec'),('horasxdia'),('xausenciatrab','trb_sugerido'),('comentarios'))
	list_filter = ('areadep','institucion')
	date_hierarchy = 'fecha_inicio'
def trbplus(trb_asignado):
	return ("%s"%trb_asignado.nombre )


class TDAdmin(admin.ModelAdmin):
	fields =(('fecha_asignacion','fecha_terminacion'),('areadep','trb_asignado'),('tipo','causaif'),('institucion','instdst'),('xsolictrab'),('xjunta_medica'),('xdispodecidec'),('funcsg_previas','funcsg_tdif'),('detallecambiox'))
	raw_id_fields =('trb_asignado','xjunta_medica','xdispodecidec','xsolictrab')
	list_display=('fecha_asignacion','trb_asignado','institucion','instdst','tipo','causaif','detallecambiox')
	search_fields = ('trb_asignado__apellido','trb_asignado__mr_legajo','instdst__codigo')
	ordering = ['fecha_asignacion','trb_asignado__apellido']
	date_hierarchy = 'fecha_asignacion'
	list_filter = ('causaif','trb_asignado__profesion','areadep','instdst','trb_asignado__especialidad_1')
	#fields = (('fecha_asignacion','codigo',),('institucion'),('profesion','espec'),(),(),('xjunta_medica','xdispodecidec','xsolictrab'),('detalle'))
	actions = [export_as_xls]
class Resultado_juntaAdmin(admin.ModelAdmin):
	list_display = ('codigo','nombre')
	ordering = ['codigo']

class ConcursoAdmin(admin.ModelAdmin):
	list_display = ('nombre','codigo')
	search_fields = ('codigo',)

class SolictrbAdmin(admin.ModelAdmin):
	list_display = ('fecha_solicitud','tipo','motivo','institucion','codigo','trb')
	search_fields = ('trb__apellido','trb__mr_legajo','codigo','trb__profesion__codigo','trb__especialidad_1__codigo')
	fields = (('fecha_solicitud','trb'),(),('areadep','institucion'),('motivo','tipo'),(),(),('comentarios'))
	raw_id_fields = ('trb',)
	date_hierarchy = 'fecha_solicitud'
	list_filter = ('tipo','institucion','areadep')
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
	search_fields = ('trabajador__apellido','trabajador__mr_legajo',)
	fields = (('fecha_ini_vigencia','trabajador'),('status'),('comentarios'))
	raw_id_fields = ('trabajador',)
	date_hierarchy = 'fecha_ini_vigencia'
	list_filter = ('status','trabajador__especialidad_1')
	actions = [export_as_xls]
class AustAdmin(admin.ModelAdmin):
	list_display = ('fecha_inicio','ausvigahoy','areadep','institucion','tipoausup','trabajador_ausente','detcausaauc','haysolicrhum','fecha_fin')
	search_fields =('trabajador_ausente__apellido','trabajador_ausente__mr_legajo','institucion__codigo')	
	fields =(('areadep','institucion'),('fecha_inicio','trabajador_ausente'),('tipo_ausencia','detcausaauc'),('fecha_fin'),('xtareasdif'),('cobertura_princ_por'),('haysolicrhum'))
	readonly_fields = ('detcausaauc','haysolicrhum') 
	raw_id_fields = ('trabajador_ausente','cobertura_princ_por','xtareasdif')
	date_hierarchy = 'fecha_inicio'
	list_filter = ('tipo_ausencia','areadep','institucion')
	ordering = ('trabajador_ausente__apellido',)

class RevReempAdmin(admin.ModelAdmin):
	list_display = ('fecha_revision','avaladoxsrvsalud','reemplazo','msgrevision')
	search_fields = ('reemplazo__areadep__codigo',)
	#fields = (('fecha_solicitud','trb'),(),('areadep','institucion'),('motivo','tipo'),(),(),('comentarios'))
	raw_id_fields = ('reemplazo',)
	date_hierarchy = 'fecha_revision'
	#list_filter = ('tipo','institucion','areadep')
	actions = [export_as_xls]


admin.site.register(Registro_reemplazo,RevReempAdmin)
admin.site.register(Ausencia_trb,AustAdmin)
admin.site.register(Registro_status,RegstatusAdmin)
admin.site.register(DispoDesiDec,DispoAdmin)
admin.site.register(Resultado_junta,Resultado_juntaAdmin)
admin.site.register(Junta_medica,JuntaAdmin)
admin.site.register(Solic_Rhum,Solic_RhumAdmin)    
admin.site.register(Trabajador,TrabajadorAdmin)
admin.site.register(Solic_modif_trb,SolictrbAdmin)
admin.site.register(Tarea_diferente,TDAdmin)
