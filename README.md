# Elixir / Phoenix containerized development environment

## What you get

* One-line dev environment setup: `docker-compose up`. It creates the database, does the Dialyzer pre-work (if the project has [Dialyxer](https://github.com/jeremyjh/dialyxir) installed), and everything else.
* Development-oriented config: Source code is mounted so that changes in the container appear on the host, and vice-versa.
* Fast re-builds because the `DOCKERFILE` is written to help Docker cache the images.
* Syncing with Postgres startup delay.
* All the crappy little dependencies installed.
* No weird hacks.

Uses Elixir 1.6.1, Phoenix 1.3.0, and latest Postgres. These are the latest versions as of 2018-02-02. Tested on MacOS and Fedora Linux, because that's what I happen to use. This is my configuration I develop with.

## Instructions

1. Copy the three config files to an existing Phoenix project which you want to Dockerize. Make `run.sh` executable, e.g. `chmod +x run.sh`.
2. Edit your development database settings to connect to Postgres at host `db`, username `postgres`, password empty string.
3. Spin it up with `docker-compose up`.

Tests can be run in the container like so:

```bash
docker-compose run web mix test
```

Or, for a slightly faster startup time,

```bash
docker-compose exec web mix test
```

... I haven't found a disadvantage of re-using the running container this way.
