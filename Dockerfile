FROM ruby:2.7.4
RUN apt-get update -qq
RUN apt-get install -y \
    postgresql-client \
    git \
    && apt-get autoclean \ && apt-get autoremove -y

RUN mkdir my-financial-moment-api
WORKDIR /my-financial-moment-api

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ADD Gemfile* /my-financial-moment-api//
RUN bundle check || bundle install
ADD . my-financial-moment-api
ENTRYPOINT [ "entrypoint.sh" ]
CMD RAILS_ENV=${RAILS_ENV} bundle exec rails db:create db:migrate db:seed && bundle exec rails s -p ${PORT} -b '0.0.0.0'
