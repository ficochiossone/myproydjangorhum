from django.shortcuts import render

# Create your views here.
def zcons_index(request):
    return render(request,'zcons/zcons_index.html', {})

