# FROM gcr.io/spark-operator/spark-py:v3.1.1-hadoop3
FROM apache/spark-py:v3.2.1
# FROM apache/spark-py:v3.1.3
# .config("spark.hadoop.fs.abfs.impl", "org.apache.hadoop.fs.azurebfs.AzureBlobFileSystem") \
# FROM gcr.io/spark-operator/spark-py:v3.1.1

USER root

WORKDIR /app

COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY script.py  /app

CMD [ "python3", "script.py" ]
# ENTRYPOINT ["bash"]
