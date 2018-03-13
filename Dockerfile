FROM ruby:2.4-alpine

RUN apk add --no-cache build-base gcc bash

RUN gem install bundler
RUN gem install jekyll

WORKDIR /src
#ADD Gemfile /src/Gemfile
#ADD Gemfile.lock /src/Gemfile.lock

VOLUME /src

ENV JEKYLL_NEW false
ENV BUNDLE_GEMFILE /src/Gemfile

EXPOSE 4000
ENTRYPOINT ["bundle", "exec"]
CMD [ "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]
