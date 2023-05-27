FROM ruby:2.7
# yarn と nodejs を install する (js関連)
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn
WORKDIR /app

# 作業dir指定
WORKDIR /app
# 作業dir にソースをコピー
COPY ./src /app
# ruby gem install
RUN bundle config --local set path 'vendor/bundle' \
&& bundle install