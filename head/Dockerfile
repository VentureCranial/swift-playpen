#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget


# Swift dependencies
RUN \
  apt-get install -y git cmake ninja-build clang python uuid-dev libicu-dev \
                     icu-devtools libbsd-dev libedit-dev libxml2-dev \
                     libsqlite3-dev swig libpython-dev libncurses5-dev \
                     pkg-config

# If you are building on Ubuntu 14.04 LTS, you'll need to upgrade
# your clang compiler for C++14 support and create a symlink:

RUN \
  sudo apt-get install -y clang-3.6 && \
  sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 100 && \
  sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100

RUN \
  rm -rf /var/lib/apt/lists/*

RUN \
   mkdir /root/swift && \
   cd /root/swift && \
   git clone https://github.com/apple/swift.git && \
   git clone https://github.com/ninja-build/ninja.git && \
   cd swift && \
   ./utils/update-checkout --clone

RUN \
   cd /root/swift/swift && \
   utils/build-script -t


# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
