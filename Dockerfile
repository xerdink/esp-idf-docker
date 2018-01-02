# Orhan Istenhickorkmaz, 2017
# GNU v3 License.
# Dockerfile to build image from it.

FROM ubuntu:16.04

MAINTAINER orhaneee

# Dependencies needed for ESP toolchain.
RUN apt-get update && apt-get -y install curl make wget git libncurses-dev flex \
	bison gperf python python-serial gosu && mkdir ~/esp

# Add user.
RUN useradd -m -s /bin/bash -g dialout esp && passwd -d esp

USER root

# Working directory.
WORKDIR /home/esp

# Finally run and pipe to tar.
RUN curl https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-73-ge28a011-5.2.0.tar.gz | tar xzf -

RUN git clone --recursive https://github.com/espressif/esp-idf.git && cd esp-idf/

ENV PATH=$PATH:/home/esp/xtensa-esp32-elf/bin \
	IDF_PATH=/home/esp/esp-idf

# Bash script which has eval in it.
COPY ./eval.sh ./eval.sh

# Change user to root.
USER root

# Run with root privilege.
RUN ["chmod", "+x", "./eval.sh"]
RUN ["chmod", "777", "-R", "/home/esp/"]

USER esp

ENTRYPOINT ["./eval.sh"]
