# Generated by Django 3.2.16 on 2022-12-07 14:16

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Courses',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Name')),
                ('description', models.TextField(blank=True, null=True, verbose_name='Description')),
                ('description_as_md', models.BooleanField(default=False, verbose_name='As markdown')),
                ('cost', models.DecimalField(decimal_places=2, default=0, max_digits=8, verbose_name='Cost')),
                ('image', models.CharField(default='no_image.svg', max_length=25, verbose_name='Image')),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='Created')),
                ('updated', models.DateTimeField(auto_now=True, verbose_name='Edited')),
                ('deleted', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='News',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255, verbose_name='Title')),
                ('preview', models.CharField(max_length=500, verbose_name='Preview')),
                ('content', models.TextField(blank=True, null=True, verbose_name='Content')),
                ('content_as_md', models.BooleanField(default=False, verbose_name='As markdown')),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='Created')),
                ('updated', models.DateTimeField(auto_now=True, verbose_name='Edited')),
                ('deleted', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Teachers',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name_first', models.CharField(max_length=100, verbose_name='Name')),
                ('name_second', models.CharField(max_length=100, verbose_name='Surname')),
                ('birthday', models.DateField(verbose_name='Birthday')),
                ('deleted', models.BooleanField(default=False)),
                ('course', models.ManyToManyField(to='mainapp.Courses')),
            ],
        ),
        migrations.CreateModel(
            name='Lessons',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.PositiveIntegerField(verbose_name='Lesson number')),
                ('title', models.CharField(max_length=150, verbose_name='Name')),
                ('description', models.TextField(blank=True, null=True, verbose_name='Description')),
                ('description_as_md', models.BooleanField(default=False, verbose_name='As markdown')),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='Created')),
                ('updated', models.DateTimeField(auto_now=True, verbose_name='Edited')),
                ('deleted', models.BooleanField(default=False)),
                ('course', models.ManyToManyField(to='mainapp.Courses')),
            ],
        ),
    ]
