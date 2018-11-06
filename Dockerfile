FROM ruby:2.5.3-alpine

RUN apk update && apk add build-base git nodejs python2 postgresql-dev postgresql-client graphicsmagick --no-cache yarn

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn

COPY . .

CMD puma -C config/puma.rb