# Elixir / Phoenix containerized development environment

This repo contains simple boilerplate files that can be added to any [Phoenix](https://www.phoenixframework.org/) application so you may run it and its database inside Docker containers using [Docker Compose](https://docs.docker.com/compose/). 

## What you get

* One-line dev environment setup: `docker-compose up`. This command creates the database, does the Dialyzer pre-work (if the project has [Dialyxer](https://github.com/jeremyjh/dialyxir) installed), and everything else.
* Developer-friendly setup: Source code is mounted so that changes in the container appear on the host and vice-versa.
* Fast re-builds because the `Dockerfile` is written to help Docker cache the images.
* Syncing with Postgres startup delay.
* All the crappy little dependencies installed.
* No weird hacks.

Uses Elixir 1.9.4 (compatible with Phoenix 1.4), and latest Postgres. 

## Instructions

1. Copy the three files (`Dockerfile`, `docker-compose.yml`, and `run.sh`) to an existing Phoenix project which you want to Dockerize. 
2. Make `run.sh` executable, e.g. `chmod +x run.sh`
3. Edit the database connection settings for the environments which will use this setup (usually `dev.exs` and `test.exs`).
You can hard-code the credentials for the relevant environment(s) to reference the hostname of `db`, a username of `postgres`, and an empty password, or you can specify environment-variable overrides like the following:

```elixir
# Inside config/dev.ex and/or config/test.exs
config :my_app, MyApp.Repo,
  hostname: System.get_env("DB_HOST", "localhost"),
  password: System.get_env("DB_PASS", "postgres"),
  # ... etc...
```

4. Spin it up with `docker-compose up`.

## Usage

Tests can be run in the container like so:

```bash
docker-compose run web mix test
```

Or, for a slightly faster startup time,

```bash
docker-compose exec web mix test
```

... I haven't found a disadvantage of re-using the running container this way.
