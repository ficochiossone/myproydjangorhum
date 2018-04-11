# -*- coding: utf-8 -*-
# Generated by Django 1.11.9 on 2018-04-09 23:56
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Areadependencia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=32)),
                ('codigo', models.CharField(max_length=8)),
            ],
            options={
                'ordering': ['codigo'],
                'db_table': 'areasdependencia',
                'verbose_name': 'Area de Dependencia',
                'verbose_name_plural': 'Areas de Dependencia',
            },
        ),
        migrations.CreateModel(
            name='ciediez',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=64, unique=True)),
                ('codigo', models.CharField(max_length=12)),
                ('descripcion', models.CharField(default=b'Descripcion..', max_length=64)),
                ('comentarios', models.TextField(blank=True, default=b'Comentarios...', null=True)),
            ],
            options={
                'ordering': ['codigo'],
                'db_table': 'dgscie10',
                'verbose_name': 'Diagnostico CIE10',
                'verbose_name_plural': 'DGNS CIE10',
            },
        ),
        migrations.CreateModel(
            name='Dds',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=14)),
                ('codigo', models.CharField(max_length=6)),
                ('num', models.IntegerField()),
            ],
            options={
                'verbose_name': 'Dia Semanal',
                'verbose_name_plural': 'Dias de Semana',
            },
        ),
        migrations.CreateModel(
            name='Diagnostico',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=64, unique=True)),
                ('codigo', models.CharField(max_length=12)),
                ('descripcion', models.CharField(default=b'Descripcion..', max_length=64)),
                ('telefonos', models.CharField(default=b'341 ....', max_length=128)),
                ('email', models.EmailField(blank=True, max_length=254)),
                ('web', models.URLField(blank=True, verbose_name=b'Sitio Web')),
                ('comentarios', models.TextField(blank=True, default=b'Comentarios...', null=True)),
                ('ciediez', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='entornos.ciediez', verbose_name=b'Ref CIE10')),
            ],
            options={
                'ordering': ['codigo'],
                'db_table': '',
                'verbose_name': 'diagnosticos',
                'verbose_name_plural': 'Diagnosticos',
            },
        ),
        migrations.CreateModel(
            name='Especialidad',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=32)),
                ('codigo', models.CharField(max_length=8)),
            ],
            options={
                'ordering': ['nombre'],
                'db_table': 'especialidades',
                'verbose_name': 'Especialidad',
                'verbose_name_plural': 'Especialidades',
            },
        ),
        migrations.CreateModel(
            name='Func_grl',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=14)),
                ('codigo', models.CharField(max_length=6)),
                ('descripcion', models.CharField(default=b'Descripcion de tarea...', max_length=128, verbose_name=b'Descripcion')),
            ],
            options={
                'verbose_name': 'Tipo Funcion',
                'verbose_name_plural': 'Funciones Generales',
            },
        ),
        migrations.CreateModel(
            name='Institucion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=64, unique=True)),
                ('codigo', models.CharField(max_length=12)),
                ('descripcion', models.CharField(default=b'Descripcion..', max_length=64)),
                ('domicilio', models.CharField(blank=True, max_length=128)),
                ('telefonos', models.CharField(default=b'341 ....', max_length=128)),
                ('email', models.EmailField(blank=True, max_length=254)),
                ('web', models.URLField(blank=True, verbose_name=b'Sitio Web')),
                ('comentarios', models.TextField(blank=True, default=b'Comentarios...', null=True)),
            ],
            options={
                'ordering': ['codigo'],
                'db_table': 'instituciones',
                'verbose_name': 'institucion',
                'verbose_name_plural': 'Instituciones',
            },
        ),
        migrations.CreateModel(
            name='Profesion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=32)),
                ('codigo', models.CharField(max_length=8)),
            ],
            options={
                'ordering': ['nombre'],
                'db_table': 'profesiones',
                'verbose_name': 'Profesion',
                'verbose_name_plural': 'Profesiones',
            },
        ),
        migrations.CreateModel(
            name='Servicio',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=32)),
                ('codigo', models.CharField(max_length=8)),
                ('descripcion', models.TextField(default=b'Descr.....')),
            ],
            options={
                'ordering': ['codigo'],
                'db_table': 'servicios',
            },
        ),
    ]
