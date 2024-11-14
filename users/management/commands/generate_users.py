from django.core.management.base import BaseCommand
from django.utils.crypto import get_random_string
from users.models import User

class Command(BaseCommand):
    help = 'Generate random users for testing'

    def add_arguments(self, parser):
        parser.add_argument('total', type=int, help='Indicates the number of users to be created')

    def handle(self, *args, **kwargs):
        total = kwargs['total']
        for _ in range(total):
            username = get_random_string(8)
            email = f'{username}@example.com'
            User.objects.create_user(username=username, email=email, password='password123', is_staff=True)
            self.stdout.write(self.style.SUCCESS(f'User "{username}" created')) 