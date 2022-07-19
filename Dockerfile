FROM alpine:3.14

# Installing dependencies
RUN apk add --no-cache nodejs npm curl gzip git

RUN cd /tmp

RUN curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz

RUN gunzip elm.gz

RUN chmod +x elm

RUN mv elm /usr/local/bin/

RUN npm install -g elm-spa@6.0.4


# Cloning the azimutt repository
RUN mkdir /var/azimutt

WORKDIR /var/azimutt

RUN git clone --branch main https://github.com/azimuttapp/azimutt.git /var/azimutt

RUN cd /var/azimutt

RUN npm install

RUN npm run build

# Installing dbml-to-azimutt
RUN git clone --branch main https://github.com/nathabonfim59/dbml-to-azimutt.git /var/dbml-to-azimutt

WORKDIR /var/dbml-to-azimutt/server

RUN cd /var/dbml-to-azimutt/server

ENV SERVER_ROOT=/var/dbml2azimutt/public
ENV SERVER_PORT=5959

RUN npm run build

WORKDIR /var/azimutt

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]
