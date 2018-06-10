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


from models import cuporServicio,PkSrvEsp,Pak_of_inst,Pak_cupo

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


class cuporSrvAdmin(admin.ModelAdmin):
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

       
class PkSrvEspAdmin(admin.ModelAdmin):
    list_display = ('dqserv','nombre','codigo',)
    fields = ('codigo','nombre',),('dqserv'),('areadep')#    #list_editable = ('asglabs',)
    search_fields = ('codigo','areadep__codigo')
    raw_id_fields = ('areadep','dqserv',) 
    list_filter=('areadep',)
    #date_hierarchy=('fecha_inicio')

 
class PakofAdmin(admin.ModelAdmin):
    list_display = ('activo','fecha_ini','institucion','srvcupor','turnos','acupturnos','Ofrnts')
    search_fields = ('institucion__codigo','srvcupor__codigo')
    #para poder poner una funcion en fields hay que ponerla en radonly_fields!!!
    readonly_fields = ('Ofrnts',)
    fields = ('activo','fecha_ini'),('srvcupor','sistema','institucion'),('periodo','turnos','acupturnos'),('asglabs','Ofrnts'),(),('comentarios')
    raw_id_fields = ('srvcupor','asglabs') 
    date_hierarchy = ('fecha_ini')
    list_filter = ('activo','sistema','institucion',)  
    actions = [export_as_xls]
#NOTESE search_field doble encadenado depak srvcupor codigo.... funciona....
class PakcupoAdmin(admin.ModelAdmin):
    list_display = ('fecha_ini','inst','depak','vistoxdcs','ncupo','AtendEn')
    search_fields = ('inst__codigo','depak__srvcupor__codigo')
    readonly_fields = ('Qofrnts','AtendEn')
    fields = (('fecha_ini','inst'),('vistoxdcs'),('depak','ncupo','periodo'),(),('AtendEn'),('Qofrnts'),('comentarios'))
    raw_id_fields = ('depak','inst') 
    date_hierarchy = ('fecha_ini')
    list_filter = ('vistoxdcs','inst',)  
    actions = [export_as_xls]



admin.site.register(cuporServicio,cuporSrvAdmin)
admin.site.register(PkSrvEsp,PkSrvEspAdmin)
admin.site.register(Pak_of_inst,PakofAdmin)
admin.site.register(Pak_cupo,PakcupoAdmin)
