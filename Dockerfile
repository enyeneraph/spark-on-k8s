# FROM gcr.io/spark-operator/spark-py:v3.1.1-hadoop3
FROM apache/spark-py:v3.2.1
# FROM apache/spark-py:v3.1.3
# .config("spark.hadoop.fs.abfs.impl", "org.apache.hadoop.fs.azurebfs.AzureBlobFileSystem") \
# FROM gcr.io/spark-operator/spark-py:v3.1.1

USER root

WORKDIR /app

COPY requirements.txt /app/
RUN pip install -r requirements.txt
# RUN cd /opt/spark/jar
# RUN  apt-get update && apt-get install -y wget 
# ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/3.2.0/hadoop-common-3.2.0.jar /opt/spark/jars
# ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/3.2.0/hadoop-azure-3.2.0.jar /opt/spark/jars
# ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure-datalake/3.2.0/hadoop-azure-datalake-3.2.0.jar  /opt/spark/jars
# ADD https://repo1.maven.org/maven2/com/microsoft/azure/azure-data-lake-store-sdk/2.0.11/azure-data-lake-store-sdk-2.0.11.jar /opt/spark/jars
COPY script.py  /app

CMD [ "python3", "script.py" ]
# ENTRYPOINT ["bash"]
