FROM node:16

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache

COPY . ./
# RUN npm run build

ENV NODE_TLS_REJECT_UNAUTHORIZED=0

ENTRYPOINT [ "node", "webhook.js"]