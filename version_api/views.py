from django.shortcuts import render

# Create your views here.
from django.http import JsonResponse

def get_version(request):
    return JsonResponse({"version": "1.0.0"})
