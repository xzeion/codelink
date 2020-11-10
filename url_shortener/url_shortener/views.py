import json
from django.shortcuts import render
from django.http import HttpResponse


def shorten(request):
    response = json.dumps({'response':'an adiquite response'})
    return HttpResponse(response,200)
    
