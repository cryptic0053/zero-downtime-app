from django.shortcuts import render

# Create your views here.
from django.http import JsonResponse

def get_version(request):
    return JsonResponse({"version": "2.0.0"})
