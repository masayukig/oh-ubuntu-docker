# for Frontend
FROM ubuntu:bionic

RUN apt-get update -y && \
    apt-get install -y \
    python3 \
    python3-pip \
    nodejs \
    npm \
    git \
  && pip install virtualenv tox

#RUN npm -g install gulp

WORKDIR /app
RUN git clone https://git.openstack.org/openstack/openstack-health
WORKDIR /app/openstack-health

#RUN npm install
#RUN /usr/local/bin/gulp prod

# ONBUILD COPY . /app
#ONBUILD RUN virtualenv /venv && /venv/bin/pip install -r /app/requirements.txt

#EXPOSE 8080
#WORKDIR /app/openstack-health/build
#RUN cp ../etc/config.json ./
# FIXME: run nginx or something for build directory
CMD ["tox", "-e", "npm-test"]
