# -*- coding: utf-8 -*-
# Generated by Django 1.11.9 on 2018-03-11 22:00
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('entornos', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Categoria_lab',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=32)),
                ('codigo', models.CharField(max_length=8)),
                ('descripcion', models.TextField(default='Descr....')),
            ],
            options={
                'db_table': 'mr_categorias',
                'verbose_name': 'Categoria ',
                'verbose_name_plural': 'Categorias Laborales',
            },
        ),
        migrations.CreateModel(
            name='Registro_categorias',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha_ini_vigencia', models.DateTimeField(blank=True, null=True, verbose_name='Fecha Nacimiento')),
                ('fecha_creacion', models.DateTimeField(auto_now_add=True, null=True)),
                ('comentarios', models.CharField(blank=True, max_length=128, null=True)),
                ('categoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rechum.Categoria_lab', verbose_name='Categoria registrada')),
            ],
            options={
                'db_table': 'registros_catgs',
                'verbose_name_plural': 'Registros de Categoria',
            },
        ),
        migrations.CreateModel(
            name='Registro_especialidad',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha_ini_vigencia', models.DateTimeField(blank=True, null=True, verbose_name='Fecha Nacimiento')),
                ('fecha_creacion', models.DateTimeField(auto_now_add=True, null=True)),
                ('comentarios', models.CharField(blank=True, max_length=128, null=True)),
                ('especialidad', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='entornos.Especialidad', verbose_name='Especialidad registrada')),
            ],
            options={
                'db_table': 'registros_esps',
                'verbose_name_plural': 'Registros de Especialidad',
            },
        ),
        migrations.CreateModel(
            name='Registro_status',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha_ini_vigencia', models.DateField(blank=True, null=True, verbose_name='Fecha Inicio Vigencia')),
                ('comentarios', models.TextField(blank=True, null=True, verbose_name='Comentarios')),
                ('fecha_creacion', models.DateTimeField(auto_now_add=True, null=True)),
            ],
            options={
                'db_table': 'registros_status',
                'verbose_name': 'Cambio Estado',
                'verbose_name_plural': ' Modificaciones de Estado ',
            },
        ),
        migrations.CreateModel(
            name='Status_lab',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=32)),
                ('codigo', models.CharField(max_length=8)),
                ('descripcion', models.TextField(default='Descr....')),
            ],
            options={
                'db_table': 'mr_status',
                'verbose_name': 'Estado Laboral',
                'verbose_name_plural': 'Estados Laborales',
            },
        ),
        migrations.CreateModel(
            name='Trabajador',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('apellido', models.CharField(max_length=128)),
                ('nombre', models.CharField(max_length=128)),
                ('tpodoc', models.CharField(default='DNI', max_length=5)),
                ('nrodoc', models.IntegerField(default=1)),
                ('ncuitl', models.CharField(blank=True, max_length=24, null=True)),
                ('matricula', models.CharField(blank=True, max_length=16, null=True)),
                ('imgtrb', models.ImageField(blank=True, help_text='Archivo de imagen...', null=True, upload_to='fototrb/%Y/%m')),
                ('fecha_nacimiento', models.DateField(blank=True, null=True, verbose_name='Fecha de Nacimiento')),
                ('domicilio', models.CharField(blank=True, max_length=128, null=True)),
                ('telefono', models.CharField(blank=True, max_length=16, null=True)),
                ('celular', models.CharField(blank=True, default='341', max_length=64, null=True)),
                ('email', models.EmailField(blank=True, max_length=254, null=True, verbose_name='E Mail')),
                ('cuit', models.CharField(blank=True, max_length=16, null=True)),
                ('activo', models.NullBooleanField(default=True, verbose_name='Activo')),
                ('mr_fecha_ingreso', models.DateField(blank=True, null=True, verbose_name='Fecha Ingreso MR')),
                ('mr_legajo', models.IntegerField(blank=True, null=True, verbose_name='N de Legajo')),
                ('xlreparticion', models.CharField(blank=True, max_length=32, null=True, verbose_name='Reparticion')),
                ('xltipoemp', models.CharField(blank=True, max_length=32, null=True)),
                ('xlcaliflab', models.CharField(blank=True, max_length=32, null=True, verbose_name='Calificacion ')),
                ('xltitulo', models.CharField(blank=True, max_length=32, null=True)),
                ('mrmapid', models.IntegerField(blank=True, editable=False, null=True)),
                ('mrpersonaid', models.IntegerField(blank=True, editable=False, null=True)),
                ('comentarios', models.TextField(blank=True, null=True, verbose_name='Comentarios')),
                ('fecha_creacion', models.DateField(auto_now_add=True, null=True)),
                ('fecha_modificacion', models.DateField(auto_now=True, null=True)),
                ('especialidad_1', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Esp1', to='entornos.Especialidad', verbose_name='Especialidad principal')),
                ('especialidad_2', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Esp2', to='entornos.Especialidad', verbose_name='Especialidad Dos')),
                ('especialidad_3', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Esp3', to='entornos.Especialidad', verbose_name='Especialidad Tres')),
                ('especialidad_4', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Esp4', to='entornos.Especialidad', verbose_name='Especialidad Cuatro')),
                ('mr_categoria', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='rechum.Categoria_lab', verbose_name='Categoria Municipal')),
                ('mr_statuslab', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='rechum.Status_lab', verbose_name='Condicion Laboral')),
                ('profesion', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='entornos.Profesion', verbose_name='Profesion')),
            ],
            options={
                'ordering': ['apellido'],
                'db_table': 'trabajadores',
                'verbose_name': 'Trabajador',
                'verbose_name_plural': 'Trabajadores Salud',
            },
        ),
        migrations.AddField(
            model_name='registro_status',
            name='status',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rechum.Status_lab', verbose_name='Estado Laboral registrado'),
        ),
        migrations.AddField(
            model_name='registro_status',
            name='trabajador',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rechum.Trabajador', verbose_name='Trabajador'),
        ),
        migrations.AddField(
            model_name='registro_status',
            name='usuario_registro',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Registrado por'),
        ),
        migrations.AddField(
            model_name='registro_especialidad',
            name='trabajador',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rechum.Trabajador', verbose_name='Trabajador'),
        ),
        migrations.AddField(
            model_name='registro_especialidad',
            name='usuario_registro',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Registrado por'),
        ),
        migrations.AddField(
            model_name='registro_categorias',
            name='trabajador',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rechum.Trabajador', verbose_name='Trabajador'),
        ),
        migrations.AddField(
            model_name='registro_categorias',
            name='usuario_registro',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Registrado por'),
        ),
    ]
