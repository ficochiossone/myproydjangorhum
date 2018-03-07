# -*- coding: utf-8 -*-
# Generated by Django 1.11.9 on 2018-03-07 15:50
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Ausencia_trb',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('generavacgen', models.BooleanField(default=False, verbose_name=b'Vac Genuina')),
                ('solicita_cobertura', models.BooleanField(default=False, verbose_name=b'X Cubrir')),
                ('fecha_inicio', models.DateField(blank=True, null=True, verbose_name=b'Ini Ausencia')),
                ('fecha_fin', models.DateField(blank=True, null=True, verbose_name=b'Fecha Fin Ausencia')),
                ('fecha_insert', models.DateField(auto_now=True)),
                ('comentarios', models.TextField(blank=True, null=True, verbose_name=b'Comentarios')),
            ],
            options={
                'db_table': 'ausencias_trbs',
                'verbose_name': 'Ausencia TRB',
                'verbose_name_plural': 'Ausencias de Personal',
            },
        ),
        migrations.CreateModel(
            name='Tipo_Ausencia_trb',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=32)),
                ('codigo', models.CharField(max_length=8)),
                ('descripcion', models.TextField(default=b'Lic x ..')),
            ],
            options={
                'db_table': 'tipos_ausencias',
                'verbose_name_plural': 'Tipos de Ausencia ',
            },
        ),
    ]
