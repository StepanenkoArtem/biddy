FROM alpine:3.18

RUN apk update --no-cache && apk add tzdata \
  doas curl git openssl-dev readline-dev zlib-dev ruby npm nodejs ruby-dev build-base openssl-dev postgresql-dev yarn

ENV USER=biddy
ENV USER_GROUP=biddy

# Create a group and user
RUN addgroup -g 1000 ${USER_GROUP} && \
  adduser -u 1001 -G ${USER} -s /bin/sh -D ${USER} 

# Change to non-root privilege
USER ${USER}:${USER_GROUP}

ENV GEM_HOME=/home/${USER}/gems
ENV BUNDLE_PATH="$GEM_HOME"
ENV PATH="$BUNDLE_PATH/bin:$PATH"

WORKDIR /home/${USER}/app

COPY Gemfile Gemfile.lock entrypoint.sh ./
RUN gem install bundler:2.4 && bundle install 

COPY --chown=${USER}:${USER_GROUP} . .

ENTRYPOINT ["./entrypoint.sh"]
EXPOSE 3000

