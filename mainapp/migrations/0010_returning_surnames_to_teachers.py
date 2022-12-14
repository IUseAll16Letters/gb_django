from django.db import migrations, models, transaction


def forward(apps, schema_editor):
    TeachersSurnames = apps.get_model('mainapp', 'TeachersSurnames')
    surnames = TeachersSurnames.objects.values_list("teacher_surname", 'teacher_id')
    TeachersCourse = apps.get_model('mainapp', 'TeachersCourse')
    with transaction.atomic():
        for surname, idx in surnames:
            try:
                teacher = TeachersCourse.objects.get(pk=idx)
                teacher.name_second = surname
                teacher.save()
            except TeachersCourse.DoesNotExist:
                pass


def reverse(apps, schema_editor):
    Teachers = apps.get_model('mainapp', 'TeachersCourse')
    for teacher in Teachers.objects.all():
        teacher.name_second = ''
        teacher.save()


class Migration(migrations.Migration):
    dependencies = [
        ('mainapp', '0009_removing_surnames_at_teachers'),
    ]

    operations = [
        migrations.RunPython(forward, reverse)
    ]
