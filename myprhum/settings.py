


import os

from django.contrib import admin

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.11/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'ip-tke#hm_k+66#_=6iklgytt9xw6g6w@-sl-h6q8hg8=btvia'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['192.168.66.136','0.0.0.0','127.0.0.1','127',u'localhost']



# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django_extensions',
#    para usar flatpages....
    # cuando esto estaba en uso se jodia con Site matching query does not exist.
    'django.contrib.sites',
#		'django.contrib.flatpages',
#    aplicaciones para admin...
		'servicios','entornos','rechum','oytred',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'myprhum.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR,'mistemplates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'myprhum.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.11/ref/
DATABASES = {
    'default': {
##        'ENGINE': 'django.db.backends.sqlite3',
##        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        'ENGINE': 'django.db.backends.mysql',
        'NAME':'dbrhum',
        'USER':'root',
        'PASSWORD':'Fico@mysql',
        'HOST':'',
        'PORT':'',
 
    }
}


# Password validation
# https://docs.djangoproject.com/en/1.11/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/1.11/topics/i18n/

LANGUAGE_CODE = 'es-AR'

#TIME_ZONE = 'UTC'
TIME_ZONE = 'America/Argentina/Buenos_Aires'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.11/howto/statdjango admin customize ic-files/

STATIC_URL = '/static/'
#agregados enero 27 2k18

STATIC_ROOT = os.path.join(BASE_DIR, 'static/')

admin.site.site_title = 'Control De Sitio'
admin.site.site_header = 'Sitio Direccion Operativa'
admin.site.index_title = 'Administracion Direcciones'
#SIDE_ID = 1

print """
--------------------------------------------------------------------------------

     INFORME DE DJANGO SETTINGS                                                .


SETEOS DE archivo settings py

alojado en

    %s

_______________________________________


templates en 

    %s

------------------------------------------

Django APLICACIONES INSTALADAS

    %s 
_______________________________________________ 



FIN DE settings.py
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
"""%(BASE_DIR,TEMPLATES,INSTALLED_APPS)


