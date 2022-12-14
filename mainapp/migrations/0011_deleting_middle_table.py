from django.db import migrations


def forward(apps, schema_editor):
    pass


def reverse(apps, schema_editor):
    pass


class Migration(migrations.Migration):
    dependencies = [
        ('mainapp', '0010_returning_surnames_to_teachers'),
    ]

    operations = [
        migrations.DeleteModel(
            name='TeachersSurnames',
        ),

        migrations.RunPython(forward, reverse)
    ]
