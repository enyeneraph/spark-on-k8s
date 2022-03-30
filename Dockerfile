# FROM gcr.io/spark-operator/spark-py:v3.1.1
FROM gcr.io/spark-operator/spark-py:v3.1.1-hadoop3

USER root

WORKDIR /app

COPY requirements.txt /app/

RUN pip install -r requirements.txt

COPY script.py  /app

ENTRYPOINT [ "bash" ]
# ENTRYPOINT [ "/opt/entrypoint.sh" ]

# /opt/spark/bin/pyspark \
#   --conf spark.hadoop.fs.azure.account.key.teststore70.dfs.core.windows.net=0IN8WZ/gmtdx7odCrURx+zFecEOUjhy4alMwOVi6hbh7C+nDVLHHbzkl0Rv3jSZ3KyN/5/vpKio5Yps8RC46Kw==  \
#   --packages org.apache.hadoop:hadoop-azure:3.2.1,org.apache.hadoop:hadoop-azure-datalake:3.2.1