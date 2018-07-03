FROM ruby:2.4.1-alpine
# Install system dependencies and remove the cache to free up space afterwards
RUN apk --update add --virtual build-dependencies build-base ruby-dev openssl-dev \
  libxml2-dev libxslt-dev postgresql-dev postgresql-client libc-dev linux-headers \
  nodejs tzdata bash && \
  rm -rf /var/cache/apk/*
# Add the Gemfile and Gemfile.lock from our app
ADD Gemfile /app/
ADD Gemfile.lock /app/
# Install bundler and run bundle install to install the gems from
# the Gemfile
RUN gem install bundler && \
  cd /app ; bundle install --without development test
# Add the rest of the app, change the owner to nobody instead of the default:
# root.
ADD . /app
RUN chown -R nobody:nogroup /app
# Switch to the nobody user from here on down
USER nobody
# Set some environment variables and their default values
# These can be overridden when we run the container
ENV PORT 3000
ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_SERVE_STATIC_FILES true
ENV SECRET_KEY_BASE=8ce4043f8c9a3434334544c5ec6d32eb73662c44a00a4963619e1c98b2e57b0cdb6c0973cc8a50b67b655aaa7054d9629e60614233d5f6a66697c29c41700948
ENV DATABSE_URL=postgres://postgres:todos@db5432/todos
# Set the working directory for the commands that we run inside containers
# from this image
WORKDIR /app
# Precompile assets
RUN cd app ; rake assets:precompile
# Set the default command to run, if we don't provide a command when we run
# a container from this Images
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
