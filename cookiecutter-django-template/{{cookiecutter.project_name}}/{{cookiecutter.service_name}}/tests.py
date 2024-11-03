from django.test import TestCase

# Create your tests here.
from .views import hello
class TestHello(TestCase):
    def test_hello(self):
        self.assertEqual(hello(), 'hello')