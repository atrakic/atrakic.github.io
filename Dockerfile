FROM ruby:2.4-alpine

RUN apk add --no-cache build-base gcc bash

RUN gem install jekyll

# Install nokogiri separately because it's special
RUN gem install nokogiri -v 1.6.7.2 -- --use-system-libraries

WORKDIR /src
#ADD Gemfile /src/Gemfile
#ADD Gemfile.lock /src/Gemfile.lock

#RUN bundle config --global silence_root_warning 1
#RUN bundle config build.nokogiri --use-system-libraries && \
#    bundle check || bundle install && \
#    bundle update

VOLUME /src

ENV JEKYLL_NEW false
ENV BUNDLE_GEMFILE /src/Gemfile

EXPOSE 4000
ENTRYPOINT ["bundle", "exec"]
CMD [ "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]
