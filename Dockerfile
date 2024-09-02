FROM python:3.10-slim-buster

WORKDIR /src

COPY ./app/requirements.txt requirements.txt

RUN pip install -r requirements.txt

# Set environment variables

ENV DB_USERNAME="mypassword" 
ENV DB_PASSWORD="jdavidson"
ENV DB_HOST="192.168.65.3" 
ENV DB_PORT="5433"
ENV DB_NAME="jddatabase"

COPY ./app .

CMD python app.py

