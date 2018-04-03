# -*- coding: utf-8 -*-
# Generated by Django 1.11.9 on 2018-04-01 12:40
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import servicios.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('rechum', '0001_initial'),
        ('entornos', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Asigna_lab',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('activo', models.BooleanField(default=True, verbose_name=b'Activo')),
                ('tipoasignacion', models.CharField(choices=[('REG', 'Regular'), ('KBT', 'Cubre Ausencia'), ('CTO', 'Contrato')], default=b'REG', max_length=12, verbose_name=b'Tipo Asignacion')),
                ('fecha_inicio', models.DateField(verbose_name=b'Fecha Inicio Actividad')),
                ('fecha_fin', models.DateField(blank=True, null=True, verbose_name=b'Fecha Fin Actividad')),
                ('modosemanal', models.CharField(choices=[('TLD', 'Todas las Semanas'), ('UDS', 'Semana x medio'), ('LAV', 'Rotativo'), ('XTR', 'ExtraOrdinario')], max_length=18, verbose_name=b'Frecuencia mensual')),
                ('horasxdia', models.IntegerField(verbose_name=b'Horas x Dia')),
                ('comentarios', models.TextField(blank=True, max_length=128, null=True)),
                ('fecha_registro', models.DateField(auto_now=True)),
                ('areadep', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='entornos.Areadependencia', verbose_name=b'Area Responsable')),
                ('dds', models.ManyToManyField(to='entornos.Dds', verbose_name=b'DiasSemanales')),
                ('espec', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='entornos.Especialidad', verbose_name=b'Esp')),
            ],
            options={
                'db_table': 'asignalabs',
                'verbose_name': 'Asignacion',
                'verbose_name_plural': 'Asignaciones laborales',
            },
        ),
        migrations.CreateModel(
            name='Contrato',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nhoras', models.IntegerField(blank=True, null=True, verbose_name=b'N de horas  ')),
                ('fecha_inicio', models.DateTimeField(verbose_name=b'Fecha Inicio Actividad')),
                ('fecha_fin', models.DateTimeField(verbose_name=b'Fecha Finalizacion Actividad')),
                ('fecha_solicitud', models.DateTimeField(blank=True, null=True, verbose_name=b'Fecha Solicitud')),
                ('fecha_insert', models.DateField(auto_now=True)),
                ('fecha_cobro', models.DateTimeField(blank=True, null=True, verbose_name=b'FechaCobro')),
                ('comentarios', models.TextField(blank=True, null=True, verbose_name=b'Comentarios')),
                ('trabajador', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rechum.Trabajador', verbose_name=b'Trabajador Contratado')),
                ('usuario_registro', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name=b'Registrado por')),
                ('xausenciatrab', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='rechum.Ausencia_trb', verbose_name=b'Cobertura Ausencia ')),
            ],
            options={
                'db_table': 'contratos',
                'verbose_name_plural': 'Contratos Mensuales',
            },
        ),
        migrations.CreateModel(
            name='Dia_Sm',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=12)),
                ('codigo', models.CharField(max_length=6)),
            ],
            options={
                'db_table': 'ddlasem',
                'verbose_name': 'Dia Semana',
                'verbose_name_plural': 'Dias de la Semana',
            },
        ),
        migrations.CreateModel(
            name='Extension',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nhoras', models.IntegerField(blank=True, null=True, verbose_name=b'N de horas ')),
                ('fecha_inicio', models.DateTimeField(default=servicios.models.default_hora_ini, verbose_name=b'Fecha Inicio Extension')),
                ('fecha_fin', models.DateTimeField(verbose_name=b'Fecha Finalizacion Actividad')),
                ('fecha_solicitud', models.DateTimeField(blank=True, null=True, verbose_name=b'Fecha Solicitud')),
                ('fecha_insert', models.DateField(auto_now=True)),
                ('fecha_cobro', models.DateTimeField(blank=True, null=True, verbose_name=b'FechaCobro')),
                ('comentarios', models.TextField(blank=True, null=True, verbose_name=b'Comentarios')),
                ('asignalab', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='servicios.Asigna_lab', verbose_name=b'Para cumplir Asignacion ')),
                ('trabajador', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rechum.Trabajador', verbose_name=b'Trabajador')),
                ('usuario_registro', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name=b'Registrado por')),
            ],
            options={
                'db_table': 'extensiones',
                'verbose_name_plural': 'Extensiones Horarias ',
            },
        ),
        migrations.CreateModel(
            name='Func_lab',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=32)),
                ('codigo', models.CharField(max_length=12)),
                ('descripcion', models.TextField(default=b'Descripcion ...')),
            ],
            options={
                'ordering': ['nombre'],
                'db_table': 'funclabs',
                'verbose_name': 'Funcion',
                'verbose_name_plural': 'Funciones Laborales',
            },
        ),
        migrations.CreateModel(
            name='Guardia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('vigencia', models.BooleanField(default=True, verbose_name=b'Vigencia')),
                ('tipopresencia', models.CharField(choices=[('ACTIVO', 'Activo'), ('PASIVO', 'Pasivo'), ('DIF', 'Dif')], default=b'ACT', max_length=12, verbose_name=b'Tipo Presencial')),
                ('modo', models.CharField(choices=[('REG', 'Regular'), ('CBA', 'Cubre Ausencia')], default=b'ACT', max_length=12, verbose_name=b'Tipo Presencial')),
                ('responsabilidad', models.CharField(choices=[('J G', 'Jefe Dia'), ('Esp', 'Especialista'), ('DIF', 'Dif')], default=b'REG', max_length=12, verbose_name=b'Dia de la Semana')),
                ('fecha_inicio', models.DateTimeField(default=servicios.models.default_hora_ini, verbose_name=b'Fecha Inicio Actividad')),
                ('fecha_fin', models.DateTimeField(blank=True, null=True, verbose_name=b'Fecha Fin Actividad')),
                ('comentarios', models.TextField(blank=True, max_length=128, null=True)),
                ('fecha_registro', models.DateField(auto_now=True)),
                ('espec', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='entornos.Especialidad', verbose_name=b'Esp')),
                ('institucion', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='entornos.Institucion', verbose_name=b'Institucion Referente')),
                ('profesion', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='entornos.Profesion', verbose_name=b'PROFESION')),
                ('servicio', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='entornos.Servicio', verbose_name=b'Servicio Servicio Referente')),
                ('trabajador', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='rechum.Trabajador', verbose_name=b'Trabajador')),
                ('usuario_registro', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name=b'Registrado por')),
            ],
            options={
                'db_table': 'guardias',
                'verbose_name': 'Guardia',
                'verbose_name_plural': 'Guardias',
            },
        ),
        migrations.CreateModel(
            name='Reemplazo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nhoras', models.IntegerField(blank=True, null=True, verbose_name=b'N de horas ')),
                ('fecha_inicio', models.DateField(verbose_name=b'Fecha Inicio Actividad')),
                ('fecha_solicitud', models.DateTimeField(blank=True, null=True, verbose_name=b'Fecha Solicitud')),
                ('fecha_insert', models.DateField(auto_now=True)),
                ('fecha_cobro', models.DateTimeField(blank=True, null=True, verbose_name=b'FechaCobro')),
                ('comentarios', models.TextField(blank=True, null=True, verbose_name=b'Comentarios')),
                ('areadep', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='entornos.Areadependencia', verbose_name=b'Area Responsable')),
                ('asglabs', models.ManyToManyField(to='servicios.Asigna_lab', verbose_name=b'Modulo asignado')),
                ('trabajador', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rechum.Trabajador', verbose_name=b'Trabajador')),
                ('usuario_registro', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name=b'Registrado por')),
            ],
            options={
                'db_table': 'reemplazos',
                'verbose_name_plural': 'Reemplazos Mensual',
            },
        ),
        migrations.AddField(
            model_name='asigna_lab',
            name='funcion',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='servicios.Func_lab', verbose_name=b'Funcion'),
        ),
        migrations.AddField(
            model_name='asigna_lab',
            name='institucion',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='entornos.Institucion', verbose_name=b'Institucion Referente'),
        ),
        migrations.AddField(
            model_name='asigna_lab',
            name='profesion',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='entornos.Profesion', verbose_name=b'PROFESION'),
        ),
        migrations.AddField(
            model_name='asigna_lab',
            name='servicio',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='entornos.Servicio', verbose_name=b'Servicio Servicio Referente'),
        ),
        migrations.AddField(
            model_name='asigna_lab',
            name='trabajador',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rechum.Trabajador', verbose_name=b'Trabajador'),
        ),
        migrations.AddField(
            model_name='asigna_lab',
            name='usuario_registro',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name=b'Registrado por'),
        ),
        migrations.AddField(
            model_name='asigna_lab',
            name='xausenciatrab',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='rechum.Ausencia_trb', verbose_name=b'Cubre Ausencia '),
        ),
    ]
