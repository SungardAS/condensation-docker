FROM node:6-slim

# Support packages dependencies using git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Yeoman does not run well as root inside a container
# We create a `condensation` user to that will execute
# all commands.
RUN useradd -ms /bin/bash condensation

# This will be the the working directory for the contianer
RUN mkdir /particles \
  && chown condensation /particles


# Using ADD we can cache-bust anytime a new release of generator-condensation
# is released
ADD https://github.com/SungardAS/generator-condensation/archive/master.tar.gz /home/condensation/generator-condensation-master.tar.gz

# Install Yeoman and generator-condensation globally and
# clean up after ourselves.
RUN npm install -s -g yo /home/condensation/generator-condensation-master.tar.gz \
  && npm cache clean \
  && rm /home/condensation/generator-condensation-master.tar.gz

# Add all helper scripts
ADD scripts/ /scripts/

# Switch user to `condensation`. This allows Yeoman to run
# correctly inside a container
USER condensation

WORKDIR /particles

VOLUME ["/home/condensation","/particles"]

ENTRYPOINT ["/scripts/entry"]

