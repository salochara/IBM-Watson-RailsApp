FROM ruby:2.7.0

RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn && \
  apt-get install libsqlite3-dev

RUN mkdir /app
WORKDIR /app

EXPOSE 3000

COPY Gemfile .
COPY Gemfile.lock .
RUN gem update bundler
RUN gem install --dev ibm_watson
RUN gem install sqlite3 -v 1.4.2

RUN bundle install --jobs 5

COPY package.json .
COPY yarn.lock .
RUN yarn install