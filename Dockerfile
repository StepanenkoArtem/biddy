FROM alpine:3.18

RUN apk update --no-cache && apk add tzdata \
  doas curl git openssl-dev readline-dev zlib-dev ruby npm nodejs ruby-dev build-base openssl-dev postgresql-dev yarn

# Create a group and user
RUN addgroup -g 1000 biddy && \
  adduser -u 1000 -G biddy -s /bin/sh -D biddy 

# Change to non-root privilege
USER biddy:biddy

ENV GEM_HOME=/home/biddy/gems
ENV BUNDLE_PATH=$GEM_HOME

WORKDIR /app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler  && gem install sidekiq
COPY . . 

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

