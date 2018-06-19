from django.conf.urls import include,url
from . import views

urlpatterns = [
    url(r'^$',views.zcons_index),
#    url(r'^$',views.post_listado),
#    url(r'^bitacora$',views.bitacora),
#    url(r'dyh',views.dyhactual),

]
