# oneross/smashross:v3
# https://hub.docker.com/_/ruby
FROM ruby:3.1.3

EXPOSE 3030

# Install production dependencies.
WORKDIR /usr/src/app
COPY ./smash-ross/Gemfile ./smash-ross/Gemfile.lock ./

# nodejs - complicated
RUN apt-get update; \
    apt-get install -y curl gnupg; \
    curl -sL https://deb.nodesource.com/setup_19.x | bash -; \
    apt-get install -y nodejs; \
    rm -rf /var/lib/apt/lists/*

# Copy local code to the container image.
COPY ./smash-ross ./

# Build
ENV BUNDLE_FROZEN=true
RUN gem install eventmachine --pre && gem install bundler && bundle install --without test

# Run the web service on container startup.
CMD smashing start
