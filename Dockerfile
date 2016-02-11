# Pull base image.
FROM dtr.cucloud.net/cs/base

# File Author / Maintainer
MAINTAINER Shawn Bower <shawn.bower@gmail.com>

# variable for latest script version
ENV SCRIPT_VERSION 1.2.1

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y unzip libwww-perl libcrypt-ssleay-perl libswitch-perl libdatetime-perl && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /

RUN wget http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-${SCRIPT_VERSION}.zip
RUN unzip CloudWatchMonitoringScripts-${SCRIPT_VERSION}.zip
RUN rm CloudWatchMonitoringScripts-${SCRIPT_VERSION}.zip

COPY monitor.rb /opt/monitor.rb

# Define default command.
CMD ["/opt/monitor.rb"]
