from django.shortcuts import render

# Create your views here
def post_listado(request):
    return render(request,'servicios/post_listado.html',{})
    
