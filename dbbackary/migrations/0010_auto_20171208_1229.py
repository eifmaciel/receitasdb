# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2017-12-08 12:29
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dbbackary', '0009_auto_20171208_1215'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cozinheiro',
            name='cpf',
            field=models.BigIntegerField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='degustador',
            name='cpf',
            field=models.BigIntegerField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='funcionario',
            name='cpf',
            field=models.BigIntegerField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='livro',
            name='cpf',
            field=models.BigIntegerField(primary_key=True, serialize=False),
        ),
    ]
