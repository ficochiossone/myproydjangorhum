# -*- coding: utf-8 -*-
# Generated by Django 1.11.9 on 2018-03-22 22:47
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('ausencias', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('rechum', '0001_initial'),
        ('entornos', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='junta_realizada',
            name='diagnostico_a',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='dgj_a', to='entornos.ciediez', verbose_name=b'Diagnostico Principal'),
        ),
        migrations.AddField(
            model_name='junta_realizada',
            name='diagnostico_b',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='dgj_b', to='entornos.ciediez', verbose_name=b'Diagnostico B'),
        ),
        migrations.AddField(
            model_name='junta_realizada',
            name='diagnostico_c',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='dgj_c', to='entornos.ciediez', verbose_name=b'Diagnostico C'),
        ),
        migrations.AddField(
            model_name='junta_realizada',
            name='diagnostico_d',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='dgj_d', to='entornos.ciediez', verbose_name=b'Diagnostico D'),
        ),
        migrations.AddField(
            model_name='junta_realizada',
            name='institucion',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='entornos.Institucion', verbose_name=b'Institucion '),
        ),
        migrations.AddField(
            model_name='junta_realizada',
            name='trabajador',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='TraJuntap', to='rechum.Trabajador', verbose_name=b'Trabajador evaluado'),
        ),
        migrations.AddField(
            model_name='junta_realizada',
            name='trb_evaluador_a',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Evaluador_a', to='rechum.Trabajador', verbose_name=b'Evaluado Por'),
        ),
        migrations.AddField(
            model_name='junta_realizada',
            name='trb_evaluador_b',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Evaluador_b', to='rechum.Trabajador', verbose_name=b'Evaluado Por'),
        ),
        migrations.AddField(
            model_name='junta_realizada',
            name='trb_evaluador_c',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Evaluador_c', to='rechum.Trabajador', verbose_name=b'Evaluado Por'),
        ),
        migrations.AddField(
            model_name='junta_realizada',
            name='trb_evaluador_d',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Evaluador_d', to='rechum.Trabajador', verbose_name=b'Evaluado Por'),
        ),
        migrations.AddField(
            model_name='dispo_junta',
            name='ausencia_referida',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='ausencias.Ausencia_trb', verbose_name=b'Ausencia Vinculada'),
        ),
        migrations.AddField(
            model_name='dispo_junta',
            name='junta_determinante',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ausencias.Junta_realizada', verbose_name=b'Junta evaluadora'),
        ),
        migrations.AddField(
            model_name='dispo_junta',
            name='trabajador',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='rechum.Trabajador', verbose_name=b'Trabajador evaluado'),
        ),
        migrations.AddField(
            model_name='dispo_gestion',
            name='trabajador',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='rechum.Trabajador', verbose_name=b'Trabajador evaluado'),
        ),
        migrations.AddField(
            model_name='ausencia_trb',
            name='areadep',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='entornos.Areadependencia', verbose_name=b'Area Dep'),
        ),
        migrations.AddField(
            model_name='ausencia_trb',
            name='cobertura_princ_por',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='TrCobertor', to='rechum.Trabajador', verbose_name=b'Cobertura Por'),
        ),
        migrations.AddField(
            model_name='ausencia_trb',
            name='diagnostico',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='entornos.Diagnostico', verbose_name=b'Diagnostico'),
        ),
        migrations.AddField(
            model_name='ausencia_trb',
            name='institucion',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='entornos.Institucion', verbose_name=b'Institucion '),
        ),
        migrations.AddField(
            model_name='ausencia_trb',
            name='tipo_ausencia',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='ausencias.Tipo_Ausencia_trb', verbose_name=b'Motivo de Solicitud'),
        ),
        migrations.AddField(
            model_name='ausencia_trb',
            name='trabajador_ausente',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='TrAreemp', to='rechum.Trabajador', verbose_name=b'Trabajador ausente'),
        ),
        migrations.AddField(
            model_name='ausencia_trb',
            name='usuario_registro',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name=b'Registrado por'),
        ),
        migrations.AddField(
            model_name='ausencia_trb',
            name='xdispo_gestion',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='ausencias.Dispo_Gestion', verbose_name=b'X Disposicion Gestion'),
        ),
        migrations.AddField(
            model_name='ausencia_trb',
            name='xdispo_junta',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='ausencias.Dispo_Junta', verbose_name=b'X Dictamen Junta'),
        ),
    ]
