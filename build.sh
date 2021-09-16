 # Builds images
   docker build -f Dockerfile_base -t spark-base-3.0.2 .
   docker build -f Dockerfile_master -t spark-master .
   docker build -f Dockerfile_worker -t spark-worker .


   
# docker build -t spark-base-3.0.2 .
# docker build -t spark-master .
# docker build -t spark-worker .
# docker build -t spark-jupyter .
