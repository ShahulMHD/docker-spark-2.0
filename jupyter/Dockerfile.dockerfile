FROM spark-base-3.0.2

   # Python packages
   RUN pip3 install wget requests pandas numpy findspark jupyterlab pyspark==3.4

   EXPOSE 8888

   WORKDIR ${SHARED_WORKSPACE}

   CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser
