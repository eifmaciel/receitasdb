# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2017-12-08 00:24
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dbbackary', '0002_receipts'),
    ]

    operations = [
        migrations.CreateModel(
            name='goods',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('food', models.CharField(max_length=50)),
                ('type_food', models.CharField(max_length=50)),
                ('price', models.FloatField()),
                ('flavor', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'goods',
            },
        ),
    ]