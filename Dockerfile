FROM alpine:3.18

RUN apk update --no-cache && apk add tzdata \
  doas curl git openssl-dev readline-dev zlib-dev yaml-dev ruby npm nodejs ruby-dev build-base openssl-dev postgresql-dev yarn
RUN npm install -g sass esbuild 
ENV USER=biddy
ENV USER_GROUP=biddy

# Create a group and user
RUN addgroup -g 1000 ${USER_GROUP} && \
  adduser -u 1000 -G ${USER} -s /bin/sh -D ${USER} 

# Change to non-root privilege
USER ${USER}:${USER_GROUP}

ENV GEM_HOME=/home/${USER}/gems
ENV BUNDLE_PATH="$GEM_HOME"
ENV PATH="$BUNDLE_PATH/bin:$PATH"

WORKDIR /home/${USER}/app

COPY Gemfile entrypoint.sh ./

COPY --chown=${USER}:${USER_GROUP} . .

RUN gem install bundler && gem update --system && bundle install

ENTRYPOINT ["./entrypoint.sh"]
EXPOSE 3000

