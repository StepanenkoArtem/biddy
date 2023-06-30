FROM ruby:3.2.2-alpine

# Set environment variables
ENV RAILS_ROOT /app 

# Install dependencies: build tools, postgres client, nodejs for asset compilation
RUN apk update
RUN apk add --update \
  build-base \
  postgresql-dev \
  postgresql-client \
  nodejs \
  yarn \
  tzdata 


# Set working directory
WORKDIR $RAILS_ROOT

# Add Gemfile and Gemfile.lock
COPY Gemfile Gemfile
# COPY Gemfile.lock Gemfile.lock

# Install Bundler and gems
RUN gem install bundler:2.1.4 && bundle install 

# Add the app code to the image
COPY . .

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
