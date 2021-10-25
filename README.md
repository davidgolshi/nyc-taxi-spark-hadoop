# NYC Taxi Big Data Project

## Table of Contents
---
1. About This Project
   - Introduction
   - Frameworks & Libraries
   - Dataset
2. Getting Started
   - Installation Guides
   - Included Files

## About This Project
---
### Introduction

This project aims to provide a demo of "big data" analytics and processing/engineering by establishing the environment for processing and analysis using relevant data processing methods/libraries. Please feel free to provide any feedback, any help and or guidance on more relevant/appropriate methods will always be appreciated! Let's get started.

What exactly is "big data"? We can refer to [Wikipedia](https://en.wikipedia.org/wiki/Big_data) for a baseline understanding.

>Big data is a field that treats ways to analyze, systematically extract information from, or otherwise deal with data sets that are too large or complex to be dealt with by traditional data-processing application software.

To elaborte further on this definition, I would like to add a more tangible understanding of the issue with large datasets. Resulting from many discussions with my mentors and experiences:

>Large datasets are too large to fit in the memory of the system or too complex to process on the system causing impractically long times for processing/analysis. 
---
### Frameworks & Libraries
This project was done on a system running [Ubuntu 20.04 LTS](https://ubuntu.com/download/desktop) with a [compatible GPU](https://developer.nvidia.com/cuda-gpus) for GPU utilization.
 - [Anaconda/Miniconda](https://www.anaconda.com/) 
 - [Python 3.8](https://www.python.org/) 
 - [Hadoop 3.3.1](https://hadoop.apache.org/)
 - [Spark/PySpark 3.1.2](https://spark.apache.org/)
 - [RAPIDS Accelerator for Apache Spark](https://nvidia.github.io/spark-rapids/)
 - [CUDA 11.2](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html)
 - NVIDIA Driver Version: 490
 - [Java 11 (OpenJDK)](https://openjdk.java.net/)

This project will be done as an on-prem implementation. It's likely these projects/environenments are deployed on cloud for execution on multiple clusters. For example Amazon's or Google's big data platforms [AWS EMR](https://aws.amazon.com/emr/) & [GCP Dataproc](https://cloud.google.com/dataproc).

---
### Dataset
This project utilizes the [NYC-Taxi dataset](https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page), analyzing data from the years 2017-2020. The 4 years of totals to approximately 325 million rows, about 30gb of csv data. The data contains the following information from the data dictionary provied by [www1.nyc.gov](https://www1.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf)

| Field Name          | Description |
| --------------------| ----------- |
| VendorID            |A code indicating the TPEP provider that provided the record:<br />1= Creative Mobile Technologies LLC<br /> 2= VeriFone Inc.| 
|tpep_pickup_datetime |The date and time when the meter was engaged. |  
|tpep_dropoff_datetime|The date and time when the meter was disengaged. |
|Passenger_count      |The number of passengers in the vehicle.<br/>This is a driver-entered value.|
|Trip_distance        |The elapsed trip distance in miles reported by the taximeter.|
|PULocationID         |TLC Taxi Zone in which the taximeter was engaged |
|DOLocationID         |TLC Taxi Zone in which the taximeter was disengaged |
|RateCodeID           |The final rate code in effect at the end of the trip. <br />1=Standard rate <br />2=JFK <br />3=Newark <br />4=Nassau or Westchester <br />5=Negotiated fare <br />6=Group ride |
|Store_and_fwd_flag   |This flag indicates whether the trip record was held in vehicle memory before sending to the vendor, aka “store and forward,” because the vehicle did not have a connection to the server. <br />Y=store and forward trip<br />N=not a store and forward trip| 
|Payment_type         |A numeric code signifying how the passenger paid for the trip. <br />1= Credit card <br />2= Cash <br />3= No charge <br />4= Dispute <br />5= Unknown <br />6= Voided trip |
|Fare_amount          |The time-and-distance fare calculated by the meter.| 
|Extra                |Miscellaneous extras and surcharges. Currently, this only includes the $0.50 and $1 rush hour and overnight charges.|
|MTA_tax              |$0.50 MTA tax that is automatically triggered based on the metered rate in use. |
|Improvement_surcharge|$0.30 improvement surcharge assessed trips at the flag drop. The improvement surcharge began being levied in 2015. |
|Tip_amount           |Tip amount – This field is automatically populated for credit card tips. Cash tips are not included. |
|Tolls_amount         |Total amount of all tolls paid in trip.  |
|Total_amount         |The total amount charged to passengers. Does not include cash tips. |

## Getting Started
---
### Installation Guides (Refer to Docs included)

[Anaconda/Miniconda](https://www.anaconda.com/products/individual#Downloads) - Offical website for Anaconda Installations (using Linux)
 - Create environment using Python 3.8
 ```bash
conda create -n <environment_name> python=3.8
 ```

[Hadoop](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html#Pseudo-Distributed_Operation) - Official Docs for Psuedo Distribted/Standalone Setup (Includes installation for Java and ssh setup)
 - Install Java
 - Configure Java environment
   - Set JAVA_HOME
 - Install ssh and setup passphraseless ssh
 - Install Hadoop from offical supported links
 - Configure Hadoop environment:
   - Set HADOOP_HOME, PATH
   - Define JAVA_HOME in hadoop-env.sh
- Start Hadoop file system
```bash
$ start-dfs.sh
```

[Spark](https://spark.apache.org/docs/latest/api/python/getting_started/install.html) - Official Docs for Installation
 - Install via pip (Spark for Hadoop 3.2+)
 ```bash
$ PYSPARK_HADOOP_VERSION=3.2 pip install pyspark
 ```

[CUDA Toolkit](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html) - Offical NVIDIA Docs for Insallation
- Requires NVIDIA developer account

[RAPIDS Accelerator for Spark](https://nvidia.github.io/spark-rapids/docs/get-started/getting-started-on-prem.html) - Official Docs/Repo for spark-rapids
- Create directory for Spark plugins
- Download discovery script and jar files

### Included Files
----
GetData.ipynb 
- Notebook to download data from source 
- Transform data 
- Put to hdfs

NYC_Spark.ipynb 
- Initialize and configure Spark session source
- Load data into Spark
- Data Prep & Analysis 