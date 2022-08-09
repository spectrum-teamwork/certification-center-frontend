FROM node:16

WORKDIR /app

COPY package.json package-lock.json ./
RUN rm -rf ./node_modules
RUN npm install

ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache

ARG GRIDSOME_API_HOST=http://yarlikvid.ru
ARG GRIDSOME_API_URL=http://yarlikvid.ru/api/v1
ENV NODE_TLS_REJECT_UNAUTHORIZED=0

COPY . ./
RUN npm run build

ENTRYPOINT [ "node", "webhook.js"]
