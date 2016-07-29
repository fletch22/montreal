FROM: node:argon

RUN mkdir -p /usr/src/app

COPY . /usr/src/app

RUN ./usr/src/app/npm install

# replace this with your application's default port
EXPOSE 8081

CMD['npm', 'start']