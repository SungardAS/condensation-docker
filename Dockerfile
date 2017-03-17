FROM node:6-slim

# Support packages dependencies using git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Yeoman does not run well as root inside a container.
# Create a `condensation` user that will execute
# all commands.
RUN useradd -G node -ms /bin/bash condensation

# This will be the the working directory for the contianer
RUN mkdir /particles \
  && chown condensation /particles

# Install Yeoman and generator-condensation globally and
# clean up after ourselves.
RUN npm install -s -g yo generator-condensation \
  && npm cache clean

# Add all helper scripts
ADD scripts/ /scripts/

# Switch user to `condensation`. This allows Yeoman to run
# correctly inside a container
USER condensation

WORKDIR /particles

VOLUME ["/home/condensation","/particles"]

ENTRYPOINT ["/scripts/entry"]

