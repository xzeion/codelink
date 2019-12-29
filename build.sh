#!/bin/bash
docker-compose build
docker-compose up -d
docker exec -it codelink_web_1 python manage.py makemigrations
docker exec -it codelink_web_1 python manage.py migrate

# create a super user for the django project
# NOTE: later this will be altered to take advantage of
# env variables.
docker exec -it codelink_web_1 python manage.py shell -c \
"from django.contrib.auth import get_user_model;
User = get_user_model();
User.objects.create_superuser(
  'brian',
  'brian@gratton.us',
  'ChangeMe!')"

# TODO: call docker run again to build out dummy data
# from management command once you have that written

# Shut containers down once you are done building them
docker-compose stop
