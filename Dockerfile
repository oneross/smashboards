# oneross/smashross:v3
# https://hub.docker.com/_/ruby
FROM ruby:3.1.3

EXPOSE 3030

# Install production dependencies.
WORKDIR /usr/src/app
RUN apt-get install nodejs
COPY ./smash-ross/Gemfile ./smash-ross/Gemfile.lock ./

# Copy local code to the container image.
COPY ./smash-ross ./

# Build
ENV BUNDLE_FROZEN=true
RUN gem install eventmachine --pre && gem install bundler && bundle install --without test

# Run the web service on container startup.
CMD smashing start
