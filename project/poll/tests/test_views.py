from django.test import Client, TestCase
from django.urls import reverse

from poll.models import Poll


class PollViewTestCase(TestCase):
    """Test poll views."""

    fixtures = ['poll.json']

    def setUp(self):
        """Set up."""
        self.client = Client()

    def test_poll_list(self):
        """Test poll_list returns correct results."""
        response = self.client.get(
            reverse('polls:list')
        )

        self.assertEqual(response.status_code, 200)
        self.assertEqual(len(response.json()), 1)
