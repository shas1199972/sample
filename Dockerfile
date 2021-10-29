FROM node:12.2.0

ARG environment

RUN echo passed environment: v2

#Working Directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

#add path
ENV PATH /usr/src/app/node_modules/.bin:$PATH

#Install app dependencies
COPY package*.json /usr/src/app/

#COPY ./node_modules/primeng/resources/themes/tcs /usr/src/app/node_modules/primeng/resources/themes/tcs

RUN npm install
RUN npm install -g @angular/cli@10.0.0
RUN npm install @angular/cdk --save
RUN npm install --save-dev node-sass

#Bundle app resources
COPY . /usr/src/app

EXPOSE 80

USER root
ENTRYPOINT ["npm","start"]

#CMD ng serve --host 0.0.0.0