ROM arm32v7/debian:stretch-slim

EXPOSE 8080

ENV BOOTSTRAP_PKGS="\
  git \
  sudo \
  g++ \
  "

RUN apt-get update &&\
  apt-get upgrade &&\
  apt-get install -y ${BOOTSTRAP_PKGS}

RUN git clone https://github.com/OpenSprinkler/OpenSprinkler-Firmware.git &&\
  cd OpenSprinkler-Firmware &&\
  sudo ./build.sh ospi

RUN export SUDO_FORCE_REMOVE=yes &&\
  apt-get remove -y --purge ${BOOTSTRAP_PKGS} &&\
  apt-get autoremove -y &&\
  apt-get clean

CMD ["/OpenSprinkler-Firmware/OpenSprinkler"]
