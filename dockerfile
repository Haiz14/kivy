FROM debian

COPY ./ /app
WORKDIR /app

SHELL ["/bin/bash", "-c"]

RUN apt update && apt upgrade &&\
    apt-get install -y openjdk-17-jdk && \
    apt-get install -y python3 python3-pip python3.11-venv \
    binutils make csh g++ sed gawk autoconf automake autotools-dev \
    libtool pkg-config zlib1g-dev libncurses5-dev libncursesw5-dev libtinfo5 cmake libffi-dev libssl-dev \
    git unzip 

    # Setup python venv 
RUN  python3 -m venv build && \
    source build/bin/activate && \
		pip3 install -r ./requirements.txt && \
		yes | buildozer -v android debug
