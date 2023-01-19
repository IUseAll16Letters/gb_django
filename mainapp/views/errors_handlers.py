from django.shortcuts import render


def handler500(request, *args, **kwargs):
    return render(request, '500.html', status=500)
