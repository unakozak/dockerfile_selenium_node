FROM ubuntu:latest

LABEL maintainer="una.kozak@mail.ru"

WORKDIR /usr/selenium

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update -y && \
    apt-get install curl -y && \
    curl -fsSL https://deb.nodesource.com/setup_19.x | bash - &&\
    #устанавливаем nodejs
    apt-get install gcc g++ make nodejs -y  && \
    node --version && \
    #устанавливаем Webdriver
    npm install selenium-webdriver  && \
    npm install yargs && \
    #устанавливаем Java
    apt-get install default-jre -y && \
    npm install selenium-standalone --save-dev && \
    #устанавливаем Selenium server
    npx selenium-standalone install

EXPOSE 4444

CMD ["npx", "selenium-standalone", "start"]