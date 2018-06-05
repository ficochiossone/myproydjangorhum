from django.shortcuts import render
from django.http import HttpResponse
from acupor.models import Pak_of_inst

import datetime

# Create your views here
def index(request):
    esps_cuporizadas = Pak_of_inst.objects.all()
    esp_list=esps_cuporizadas.order_by('institucion')
    context = {'esp_list':esp_list}
    return render(request,'servicios/index.html',context)


def post_listado(request):
    return render(request,'servicios/post_listado.html',{})
def bitacora (request):
    return render(request,'servicios/post_listado.html',{})
def dyhactual(request):
    ahora = datetime.datetime.now()
    mihtml = "<html><body> FECHA Y HORA %s .</body></html>"%ahora
    return HttpResponse(mihtml)
    
