# Elixir / Phoenix containerized development environment

Using Elixir 1.6.1, Phoenix 1.3.0, and latest Postgres. These are the latest versions as of 2018-02-02. Tested on MacOS.

## Instructions

1. Copy the three config files to an existing Phoenix project which you want to Dockerize.
2. Edit your development database settings to connect to Postgres at host `db`, username `postgres`, password blank.
3. Spin it up with `docker-compose up`.

Tests can be run in the container like so:

```bash
docker-compose run web mix test
```

## What you get

* Development-oriented config: Source code is mounted so that changes in the container appear on the host, and vice-versa.
* Fast re-builds because the `DOCKERFILE` is written to help Docker cache the images.
* Syncing with Postgres startup delay.
* All the little crappy dependencies installed.
