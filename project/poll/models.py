from django.db import models


class Poll(models.Model):
    """A poll."""

    question = models.CharField(max_length=100)
