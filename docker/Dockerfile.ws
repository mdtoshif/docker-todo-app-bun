# Either do this or import a bun image
# FROM node:22-alpine
# npm install -g bun
##### or  #####

FROM oven/bun:1

WORKDIR /usr/src/app

COPY ./packages ./packages
COPY ./bun.lock ./bun.lock

COPY ./package.json ./package.json
COPY ./turbo.json ./turbo.json 

COPY ./apps/websocket ./apps/websocket

RUN bun install
RUN bun run db:generate

EXPOSE 8081

CMD [ "bun","run","start:websocket" ]



