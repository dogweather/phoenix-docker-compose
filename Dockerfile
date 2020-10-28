# Elixir + Phoenix
ARG EX_VERSION=latest

FROM elixir:$EX_VERSION

# Install debian packages
RUN apt-get update
RUN apt-get install --yes build-essential inotify-tools postgresql-client

# Install Phoenix packages
ARG PHX_VERSION=1.5.6
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new $PHX_VERSION

# Install node
ARG NODE_VERSION=setup_15
RUN curl -sL https://deb.nodesource.com/$NODE_VERSION.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs

WORKDIR /app

# Set port as argument
ARG PORT=4000
EXPOSE $PORT
