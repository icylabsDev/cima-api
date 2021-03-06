FROM python:3.7-alpine

COPY . /app
WORKDIR /app

RUN \
 apk add --no-cache postgresql-libs && \
 apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
 python3 -m pip install -r requirements.txt --no-cache-dir && \
 #pipenv install && \
 apk --purge del .build-deps

# RUN pip install pipenv
# RUN pipenv install 
 
EXPOSE 80

CMD ["python3", "api.py"]