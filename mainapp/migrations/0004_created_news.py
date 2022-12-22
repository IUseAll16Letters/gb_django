# Generated by Django 3.2.16 on 2022-12-12 14:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0003_created_teachers')
    ]

    operations = [
        migrations.CreateModel(
            name='News',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255, verbose_name='Title')),
                ('description', models.CharField(max_length=300, null=True, verbose_name='Preview')),
                ('author', models.CharField(default='Unknown author', max_length=70, verbose_name='Author')),
                ('content', models.TextField(blank=True, null=True, verbose_name='Content')),
                ('content_as_md', models.BooleanField(default=False, verbose_name='As markdown')),
                ('url', models.CharField(default='no_url', max_length=350, verbose_name='Source')),
                ('source', models.CharField(default='unknown_source', max_length=55, verbose_name='Source name')),
                ('image_url', models.CharField(default='not_found.gif', max_length=250, null=True, verbose_name='Image')),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='Created')),
                ('updated', models.DateTimeField(auto_now=True, verbose_name='Edited')),
                ('deleted', models.BooleanField(default=False)),
            ],
        ),
    ]
