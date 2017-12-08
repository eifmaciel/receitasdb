# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2017-12-08 00:28
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('dbbackary', '0003_goods'),
    ]

    operations = [
        migrations.CreateModel(
            name='items',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('goods_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='dbbackary.goods')),
                ('receipts_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='dbbackary.receipts')),
            ],
            options={
                'db_table': 'items',
            },
        ),
    ]