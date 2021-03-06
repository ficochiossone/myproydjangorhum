# -*- coding: utf-8 -*-
# Generated by Django 1.11.9 on 2018-05-20 20:38
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rechum', '0003_auto_20180519_1332'),
        ('servicios', '0003_auto_20180519_1332'),
    ]

    operations = [
        migrations.AddField(
            model_name='reemplazo',
            name='trbs_reemp',
            field=models.ManyToManyField(blank=True, related_name='TrReemps', to='rechum.Trabajador', verbose_name=b'Reemplazados'),
        ),
        migrations.AlterField(
            model_name='reemplazo',
            name='validado',
            field=models.BooleanField(default=False, verbose_name=b'Visto SRS'),
        ),
    ]
