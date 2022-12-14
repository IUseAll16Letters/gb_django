# Generated by Django 3.2.16 on 2022-12-12 19:31

from django.db import migrations, models


def forward(apps, schema_editor):
    print('I AM FORWARD. I AM TJE SECOND GUY!')
    surnames = apps.get_model('mainapp', 'TeachersCourse')
    surnames = surnames.objects.values_list("name_second", "id").order_by('pk')

    TeachesSurnames = apps.get_model('mainapp', 'TeachersSurnames')
    TeachesSurnames.objects.bulk_create(
        [TeachesSurnames(teacher_surname=surname[0], teacher_id=surname[1]) for surname in surnames]
    )


def reverse(apps, schema_editor):
    migrations.DeleteModel(name='TeachersSurnames',)


class Migration(migrations.Migration):
    print('I AM MIGRATION 8 I GO FIRST!')
    dependencies = [
        ('mainapp', '0007_teachers_data_migration'),
    ]

    operations = [
        migrations.CreateModel(
            name='TeachersSurnames',
            fields=(
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('teacher_id', models.BigIntegerField(verbose_name='Teacher_id')),  # need fk?
                ('teacher_surname', models.CharField(max_length=255, verbose_name='Surname'))
            )
        ),
        migrations.RunPython(forward, reverse),
    ]
