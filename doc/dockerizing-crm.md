# CRM Dockerization

## React development

When we write React, we have a node server running via yarn server

In order to replace this, we need a docker container/service to replace it

So, we could have 2 dockerfiles

dev image,
prod image

prod image:
FROM alpine-node AS builder
WORKDIR /app
COPY . /app
RUN yarn install && yarn prod

FROM php-crm
WORKDIR /app
COPY . /app
RUN composer install --no-dev
COPY --from=builder /app/publuc/build /app/public/build

dev image:
A) No nginx

(don't even know if this will work with encore...)
PHP
    FROM php-crm
    WORKDIR /app
    COPY . /app
    RUN composer install 
    CMD ['bin/console','server:start']

Node
    FROM alpine-node AS builder
    WORKDIR /app
    COPY . /app
    RUN yarn install && yarn server
