FROM node:4-slim

RUN useradd -ms /bin/bash condensation
RUN npm install -s -g yo generator-condensation
RUN mkdir /particles
RUN chown condensation /particles

ADD scripts/ /scripts/

USER condensation

VOLUME /particles
WORKDIR /particles

ENTRYPOINT ["/scripts/entry"]

