from django.db import migrations, models


def forward(apps, schema_editor):
    pass


def reverse(apps, schema_editor):
    pass


class Migration(migrations.Migration):
    print('I AM MIGRATION 11!')
    dependencies = [
        ('mainapp', '0010_returning_surnames_to_teachers'),
    ]

    operations = [
        migrations.DeleteModel(
            name='TeachersSurnames',
        ),
    ]
