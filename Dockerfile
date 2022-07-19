FROM alpine:3.14

# Instalando dependências
RUN apk add --no-cache nodejs npm curl gzip git

RUN cd /tmp

RUN curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz

RUN gunzip elm.gz

RUN chmod +x elm

RUN mv elm /usr/local/bin/

RUN npm install -g elm-spa@6.0.4


# Clonando repositório do projeto
RUN mkdir /var/azimutt

WORKDIR /var/azimutt

RUN git clone --branch main https://github.com/azimuttapp/azimutt.git /var/azimutt

RUN cd /var/azimutt

RUN npm install

RUN npm run build
