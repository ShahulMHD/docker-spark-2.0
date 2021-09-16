 # Builds images
   docker build \
   -f base.Dockerfile \
   -t spark-base-3.0.2 .

   docker build \
   -f master.Dockerfile \
   -t spark-master .

   docker build \
   -f worker.Dockerfile \
   -t spark-worker .

   docker build \
   -f jupyter.Dockerfile \
   -t spark-jupyter .