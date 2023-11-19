FROM debian:latest

RUN apt-get update \
    && apt install -y \
        build-essential \
        valgrind \
        kcachegrind
