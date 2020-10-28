# Elixir / Phoenix containerized development environment

## What you get

- One-line dev environment setup: `docker-compose up`. It creates the database, does the Dialyzer pre-work (if the project has [Dialyxer](https://github.com/jeremyjh/dialyxir) installed), and everything else.
- Development-oriented config: Source code is mounted so that changes in the container appear on the host, and vice-versa.
- Fast re-builds because the `DOCKERFILE` is written to help Docker cache the images.
- Syncing with Postgres startup delay.
- All the crappy little dependencies installed.
- No weird hacks.

The Dockerfile and docker-compose file now accept Elixir, Node and Postgres versions thru arguments. check the files for more info.

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
