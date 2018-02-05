from django.http import JsonResponse

from .models import Poll


def poll_list(request):
    """Return a list of polls."""
    data = []
    for poll in Poll.objects.all():
        data.append({'id': poll.id, 'question': poll.question})
    return JsonResponse(data, safe=False)
