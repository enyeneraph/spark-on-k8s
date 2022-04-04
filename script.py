import pyspark 
import sys 
import shutil
from pyspark import SparkContext, SparkConf  
from pyspark.sql import SparkSession  
from delta import *  
from pyspark.sql.functions import *
from pyspark.sql.types import *
from pyspark.sql.types import StructType, StructField, StringType, IntegerType, DateType
from delta.tables import DeltaTable
import click


# import logging
# logging.basicConfig(level="INFO")
# logger = logging.getLogger(__name__) # __name__=docai
# logger.info("This is an INFO message on the root logger.")


container_name       =  "gen2con"
storage_account_name =  "teststore70"
account_access_key  =   "0IN8WZ/gmtdx7odCrURx+zFecEOUjhy4alMwOVi6hbh7C+nDVLHHbzkl0Rv3jSZ3KyN/5/vpKio5Yps8RC46Kw=="


# from datetime import datetime, date
# # import pandas as pd
# from pyspark.sql import Row

# df = spark.createDataFrame([
#     Row(a=1, b=2., c='string1', d=date(2000, 1, 1), e=datetime(2000, 1, 1, 12, 0)),
#     Row(a=2, b=3., c='string2', d=date(2000, 2, 1), e=datetime(2000, 1, 2, 12, 0)),
#     Row(a=4, b=5., c='string3', d=date(2000, 3, 1), e=datetime(2000, 1, 3, 12, 0))
# ])
# df.show()
spark = SparkSession \
  .builder \
  .appName("documentai") \
  .master("local") \
  .config("spark.jars.packages", "io.delta:delta-core_2.12:1.0.0,org.apache.hadoop:hadoop-azure-datalake:3.2.1,org.apache.hadoop:hadoop-azure:3.2.1") \
  .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension") \
  .config("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog") \
  .config(f"spark.hadoop.fs.azure.account.auth.type.{storage_account_name}.dfs.core.windows.net", "SharedKey")\
  .config(f"spark.hadoop.fs.azure.account.key.{storage_account_name}.dfs.core.windows.net", f"{account_access_key}") \
 .getOrCreate()

spark.range(5).write.format("delta").save("tmp/deltab")
print("Successfully written")
df = spark.read.format("delta").load("tmp/deltab")
df.show()

#reading from azdls gen 2
df = spark.read.format("delta").load(f"abfss://{container_name}@{storage_account_name}.dfs.core.windows.net/test6")

df.show()

