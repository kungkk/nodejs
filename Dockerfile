# @link https://github.com/nodesource/distributions

FROM    ubuntu:14.04.4

RUN	apt-get install -y wget curl
RUN	curl -sL https://deb.nodesource.com/setup_0.12 | sudo -E bash -
RUN	apt-get install -y nodejs

# @link https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

EXPOSE 8080

CMD [ "npm", "start" ]

