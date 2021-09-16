FROM debian:stretch

# System packages
RUN apt-get clean && apt-get update -y && \
   apt-get install -y python3 python3-pip curl wget unzip procps openjdk-8-jdk && \
   ln -s /usr/bin/python3 /usr/bin/python && \
   rm -rf /var/lib/apt/lists/*

# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
# PYTHONHASHSEED=1

# Install Spark
ENV SPARK_VERSION=3.0.2
ENV HADOOP_VERSION=3.2
ENV SPARK_HOME=/opt/spark

wget --no-verbose -O apache-spark.tgz "https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" \
&& mkdir -p /opt/spark \
&& tar -xf apache-spark.tgz -C /opt/spark --strip-components=1 \
&& rm apache-spark.tgz


# Required directories and setting up environment variables
RUN mkdir -p /tmp/logs/ \
&& chmod a+w /tmp/logs/ \
&& mkdir /app \
&& chmod a+rwx /app \
&& mkdir /data \
&& chmod a+rwx /data

ENV JAVA_HOME=/usr
#ENV SPARK_HOME=/usr/bin/spark-bin-hadoop${HADOOP_VERSION}
ENV PATH=$SPARK_HOME:$PATH:/bin:$JAVA_HOME/bin:$JAVA_HOME/jre/bin
ENV SPARK_MASTER_HOST=spark-master
#ENV SPARK_MASTER_PORT=7077
ENV PYSPARK_PYTHON=/usr/bin/python
ENV PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH
#used in spark worker and master
ENV APP=/app 


# for jupyterlab working space 
ENV SHARED_WORKSPACE=/opt/workspace
RUN mkdir -p ${SHARED_WORKSPACE}
VOLUME ${SHARED_WORKSPACE}

#default command
CMD ["/opt/spark/bin/spark-shell", "--master", "local[*]"]
