FROM pzawad/tilix

MAINTAINER Piotr ZAWADZKI "pzawadzki@polsl.pl"

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get install -y \
    cmake \
    autoconf \
    libtool \
    pkg-config \
    build-essential \
    usbutils \
    libcppunit-dev \
    swig \
    doxygen \
    liblog4cpp5-dev \
    python3-docutils \
    python3-scipy \
    gnuradio-dev \
    liborc-dev \
    libosmocore-dev \
    gr-osmosdr \
    gir1.2-gtk-3.0 \
    gqrx-sdr pulseaudio-utils

COPY pulse-client.conf /etc/pulse/client.conf

# create user gnuradio user (and password gnuradio)
RUN usermod -a -G usrp,audio,video student

USER student

WORKDIR /home/student

CMD bash
