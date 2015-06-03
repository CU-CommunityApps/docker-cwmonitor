# Pull base image.
FROM docker.cucloud.net/base

# File Author / Maintainer
MAINTAINER Shawn Bower <shawn.bower@gmail.com>

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y unzip libwww-perl libcrypt-ssleay-perl libswitch-perl && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /

RUN wget http://ec2-downloads.s3.amazonaws.com/cloudwatch-samples/CloudWatchMonitoringScripts-v1.1.0.zip
RUN unzip CloudWatchMonitoringScripts-v1.1.0.zip
RUN rm CloudWatchMonitoringScripts-v1.1.0.zip

COPY monitor.rb /opt/monitor.rb

# Define default command.
CMD ["/opt/monitor.rb"]