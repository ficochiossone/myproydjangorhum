# -*- coding: utf-8 -*-
# Generated by Django 1.11.9 on 2018-03-07 15:50
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('servicios', '0001_initial'),
        ('ausencias', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('entornos', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='ausencia_trb',
            name='areadep',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='entornos.Areadependencia', verbose_name=b'Area Dep'),
        ),
        migrations.AddField(
            model_name='ausencia_trb',
            name='cobertura_princ_por',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='TrCobertor', to='servicios.Trabajador', verbose_name=b'Cobertura Por'),
        ),
        migrations.AddField(
            model_name='ausencia_trb',
            name='tipo_ausencia',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='ausencias.Tipo_Ausencia_trb', verbose_name=b'Motivo de Solicitud'),
        ),
        migrations.AddField(
            model_name='ausencia_trb',
            name='trabajador_ausente',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='TrAreemp', to='servicios.Trabajador', verbose_name=b'Trabajador ausente'),
        ),
        migrations.AddField(
            model_name='ausencia_trb',
            name='usuario_registro',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name=b'Registrado por'),
        ),
    ]
