FROM index.alauda.cn/hain/node:4.2.1
MAINTAINER Hain Wang <hailiang.hl.wang@gmail.com>

ENV NODE_ENV=production \
    daemon=false \
    silent=false


## Move source codes into ~/git
RUN mkdir -p /root/git/cnodebb
RUN mkdir -p /root/git/cnodebb

## Move source codes into ~/git
COPY . /root/git/cnodebb

## Install modules
WORKDIR /root/git/cnodebb/
RUN npm install -d

# Copy a config placeholder
COPY ./dockerlize/config.sample.json /root/git/cnodebb/config.json

ENTRYPOINT ["npm", "start"]

# the default port for NodeBB is exposed outside the container
EXPOSE 4567
