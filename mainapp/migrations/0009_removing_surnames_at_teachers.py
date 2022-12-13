from django.db import migrations, models, transaction


def forward(apps, schema_editor):
    Teachers = apps.get_model('mainapp', 'TeachersCourse')
    for teacher in Teachers.objects.all():
        teacher.name_second = ''
        teacher.save()


def reverse(apps, schema_editor):
    TeachersSurnames = apps.get_model('mainapp', 'TeachersSurnames')
    surnames = TeachersSurnames.objects.values_list("teacher_surname", 'teacher_id')
    TeachersCourse = apps.get_model('mainapp', 'TeachersCourse')
    with transaction.atomic():
        for idx, surname in enumerate(surnames, 1):
            try:
                teacher = TeachersCourse.objects.get(pk=surname[1])
                teacher.name_second = surname[0]
                teacher.save()
            except TeachersCourse.DoesNotExist:
                pass


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0008_create_middle_table'),
    ]
    operations = [
        migrations.RunPython(forward, reverse)
    ]
