FROM ubuntu:jammy

WORKDIR /app

COPY . .

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y nodejs npm streamlink && apt-get clean && apt-get autoremove

RUN npm config set registry http://mirrors.cloud.tencent.com/npm/

RUN npm install

VOLUME ["/data"]

CMD ["node", "index.js"]

# docker build -t m3u8-auto-recorder:latest .
