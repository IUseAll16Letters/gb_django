# Generated by Django 3.2.16 on 2022-12-19 18:06

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0007_teachers_data_migration'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='courses',
            options={'verbose_name': 'Course', 'verbose_name_plural': 'Courses'},
        ),
        migrations.AlterModelOptions(
            name='lessons',
            options={'ordering': ('course',), 'verbose_name': 'Lesson', 'verbose_name_plural': 'Lessons'},
        ),
        migrations.AlterModelOptions(
            name='news',
            options={'ordering': ('-created',), 'verbose_name': 'News', 'verbose_name_plural': 'News'},
        ),
        migrations.AlterModelOptions(
            name='teacherscourse',
            options={'verbose_name': 'Teacher', 'verbose_name_plural': 'Teachers'},
        ),
    ]