FROM python:3.9.16-slim-bullseye as prepare

ENV PATH /root/.foundry/bin:$PATH

RUN apt-get -y update; \
    apt-get -y install curl git gcc

RUN curl -L https://foundry.paradigm.xyz | bash
RUN foundryup

FROM prepare as build

COPY . .

RUN forge build

WORKDIR /
