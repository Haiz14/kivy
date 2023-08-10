FROM debian

COPY ./ /app
WORKDIR /app

SHELL ["/bin/bash", "-c"]

RUN apt update && apt upgrade &&\
    apt-get install -y python3 python3-pip python3.11-venv \
    binutils make csh g++ sed gawk autoconf automake autotools-dev \
    git unzip openjdk-17-jdk
    # Setup python venv 
RUN  python3 -m venv build && \
    source build/bin/activate && \
		pip3 install -r ./requirements.txt 
#		buildozer -v android debug
