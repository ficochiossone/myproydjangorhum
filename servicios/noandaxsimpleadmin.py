# _*_ colding: utf-8 _*_
import sys 
reload (sys)
sys.setdefaultencoding ('utf-8')

from django.contrib import admin
from django.http import HttpResponse,HttpResponseRedirect

# Register your models here.
#para usar export a excel
from django.core.exceptions import PermissionDenied
from pyExcelerator import *
from django.contrib.admin.utils import lookup_field
from django.contrib import messages

# Register your models here.
from models import Func_lab,Asigna_lab,Reemplazo
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

class Func_labAdmin(admin.ModelAdmin):
	list_display = ('nombre','codigo')
	search_fields = ('codigo',)


	
class SiXaustrabListFilter(admin.SimpleListFilter):
	title = ('XCobertura Ausencia')
	parameter_name = 'esxau'
	def lookups(self,request,model_admin):
		return(
			('xaus',('Cobertura X Ausencia')),
			('noxaus'('Asignacion Propia')),
	)

	def queryset(self,request,queryset):
		"""
			Devuelve queryset filtrada basada en valor provisto 
		"""

		if self.value()=='xaus':
			return queryset.filter(xausenciatrab__isnull=False)


		if self.value()=='noxaus':
			return queryset.filter(xausenciatrab__isnull=True)




class Asigna_labAdmin(admin.ModelAdmin):
	list_display = ('trabajador','institucion','funcion','Inddsem','horasxdia','esxausencia','xausenciatrab')
	search_fields = ('trabajador__apellido',)
	raw_id_fields =('trabajador',)
	ordering = ['institucion','trabajador']
	date_hierarchy = ('fecha_inicio')
	list_filter=('activo','institucion','trabajador__especialidad_1','funcion',SiXaustrabListFilter,'areadep','trabajador__mr_statuslab','profesion')

admin.site.register(Func_lab,Func_labAdmin)    
admin.site.register(Asigna_lab,Asigna_labAdmin)


