FROM python:3.6-alpine

RUN apk --update add git openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN apk --no-cache --update-cache add \
	gcc \
	gfortran \
	g++ \
	build-base \
	wget \
	freetype-dev \
	libpng-dev \
	openblas-dev

RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

ADD requirements.txt /app/
WORKDIR /app

RUN pip install --no-cache-dir \
	numpy \
	slycot \
	scipy \
	git+https://github.com/python-control/python-control