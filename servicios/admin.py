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

from models import Func_lab,Asigna_lab,Contrato,Reemplazo,Extension
from entornos.models import Dds

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




class Func_labAdmin(admin.ModelAdmin):
    list_display = ('nombre','codigo')
    search_fields = ('nombre',)

#### ini para neuvo listfilter#####
class SiXaustrabListFilter(admin.SimpleListFilter):
    #human leible tituloen sidebar
    title = ('X Cobertura Ausencia')
    # parametros a usar en laquery del filtrado
    parameter_name = 'esxau'
    def lookups(self,request,model_admin):
        """
        Returns a list of tuples. The first element in each
        tuple is the coded value for the option that will
        appear in the URL query. The second element is the
        human-readable name for the option that will appear
        in the right sidebar.
        """
        return(
            ('xaus',('Cobertura X Ausencia')),
            ('noxaus',('Asignacion Propia')),
        )    
        
    def queryset(self,request,queryset):
        """devuelve la queryset filtrada basada en valor provisto
           en la  query string y x self.value()

                """
        if self.value()=='xaus':
            return queryset.filter(xausenciatrab__isnull=False)
        
        if self.value()=='noxaus':
            return queryset.filter(xausenciatrab__isnull=True)
    
        

#### fin para neuvo listfilter#####

class DdsInline(admin.TabularInline):
    model = Asigna_lab.dds.through
    #fk_name = 'ddlslocal'
    
class Asigna_labAdmin(admin.ModelAdmin):

    list_display = ('trabajador','institucion','funcion','Inddsem','esxausencia','horasxdia','xausenciatrab')
    readonly_fields=('Inddsem',)
    list_display_editable = ('trabajador','institucion','funcion',)
    fields = [('activo',),('trabajador','institucion','funcion'),('areadep'),
              ('dds','modosemanal'),('horasxdia'),
              ('fecha_inicio','fecha_fin'),
              ('comentarios') ,
              ('xausenciatrab'),
              ('usuario_registro'),
              ]
    #inlines = [DdsInline]
    exclude = ['servicio']
    actions = [export_as_xls]
    search_fields = ('trabajador__apellido',)
    list_filter=('activo','institucion','trabajador__especialidad_1','funcion',SiXaustrabListFilter,'areadep','trabajador__mr_statuslab','profesion')
#    list_filter=('activo','funcion','trabajador__mr_statuslab','trabajador__especialidad_1','institucion')
    date_hierarchy=('fecha_inicio')

    raw_id_fields = ('trabajador','xausenciatrab') 
    ordering =['trabajador__apellido','funcion','institucion']
    filter_horizontal=('dds',)
class AsgInline(admin.StackedInline):
    model = Reemplazo.asglabs.through
class ReemplazoAdmin(admin.ModelAdmin):
    #inlines = [AsgInline]
    readonly_fields = ('InddAsgn','MesDelAnio')
    list_display = ('trabajador','MesDelAnio','nhoras','InddAsgn',)
    fields = (('trabajador','MesDelAnio','nhoras',),('fecha_inicio','areadep')
              ,('asglabs'),('InddAsgn',),('comentarios'),'usuario_registro')
    #list_editable = ('asglabs',)
    search_fields = ('trabajador__apellido',)
    raw_id_fields = ('trabajador','asglabs',) 
    list_filter=('fecha_inicio',)
    date_hierarchy=('fecha_inicio')




class ExtensionAdmin(admin.ModelAdmin):
    list_display = ('trabajador','fecha_inicio')
    search_fields = ('trabajador__apellido',)
    raw_id_fields = ('trabajador',) 


##revisar loq ue sigue
#class DdsInline(admin.TabularInline):
#    model = Clm_Asigna.dds.through
    


admin.site.register(Asigna_lab,Asigna_labAdmin)
admin.site.register(Func_lab,Func_labAdmin)
# uso temporario
admin.site.register(Reemplazo,ReemplazoAdmin)
admin.site.register(Extension,ExtensionAdmin)
