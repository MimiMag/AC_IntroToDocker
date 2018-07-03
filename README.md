# Advanced Class: Introduction To Docker

_In this repo, you can find the exercises that are part of the advanced class Introduction To Docker, taught in february 2017 by Codaisseur_

## How to set up

1. Clone this repo and cd into it
2. Run `docker-compose up`
3. Run docker-compose run web rake db:create db:migrate db:seed

## What I did
1. I forked the `todo_on_rails` app provided by codaisseur
2. I created a docker files based on the image `ruby:2.4.1-alpine`
3. I created a docker compose file

## Interesting Reads
* [The advanced class](https://medium.codaisseur.com/three-days-of-docker-1-7bf071d50ab4)
* [Getting Started with Kubernetes Engine - course](https://www.coursera.org/learn/google-kubernetes-engine)
* [Docker Docs](https://docs.docker.com/)
* [On Dockerfiles](https://docs.docker.com/engine/reference/builder/)
