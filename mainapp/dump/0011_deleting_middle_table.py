from django.db import migrations, models


def forward(apps, schema_editor):
    pass


def reverse(apps, schema_editor):
    pass


class Migration(migrations.Migration):
    operations = [
        migrations.DeleteModel(
            name='TeachersSurnames',
        ),
    ]
