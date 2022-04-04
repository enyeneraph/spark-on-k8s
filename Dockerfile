FROM gcr.io/spark-operator/spark-py:v3.1.1-hadoop3

USER root

WORKDIR /app

COPY requirements.txt /app/
RUN pip install -r requirements.txt

COPY script.py  /app

CMD [ "python3", "script.py" ]
