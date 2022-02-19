FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

ADD . /LocalEvents-Docker

WORKDIR /LocalEvents-Docker

RUN bundle install

EXPOSE 3000

CMD ["bash"]