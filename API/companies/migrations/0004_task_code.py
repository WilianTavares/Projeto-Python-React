# Generated by Django 4.2.4 on 2025-01-16 20:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('companies', '0003_taskstatus_task'),
    ]

    operations = [
        migrations.AddField(
            model_name='task',
            name='code',
            field=models.CharField(default=1, max_length=50, unique=True),
            preserve_default=False,
        ),
    ]
