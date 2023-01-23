from django.core.management import call_command
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    help = (
        "This commands seeks and destroys everything it sees, run!"
        "--snd=all --sos"
    )

    def handle(self, *args, **options):
        print(args)
        print(options)
        print('I seek, i seek...')
        print('I found!')
        print("DESTROY!")
        return '404'
