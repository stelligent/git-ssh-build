# syntax=docker/dockerfile:1.0.0-experimental
FROM python:alpine

ARG REPOSITORY

RUN apk add \
  openssh-client \
  git

RUN git config --global user.email "automation@stelligent.com"
RUN git config --global user.name "Automation For The People"
RUN mkdir -p -m 600 ~/.ssh &&\
  ssh-keyscan github.com >> ~/.ssh/known_hosts 

RUN --mount=type=ssh git clone ${REPOSITORY}
