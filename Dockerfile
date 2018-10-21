FROM ruby:2.5.1

ENV APP_ROOT /var/app
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

RUN apt-get update && apt-get install -y default-libmysqlclient-dev

ADD Gemfile* $APP_ROOT/

RUN bundle install

ADD . $APP_ROOT

RUN groupadd -r deployer && useradd -r -g deployer -d $APP_ROOT deployer
RUN chown -R deployer:deployer $APP_ROOT
USER deployer

EXPOSE 3000

CMD ["bundle", "exec", "rackup", "flipper-api.ru", "-p", "3000", "-s", "puma", "-o", "0.0.0.0"]
