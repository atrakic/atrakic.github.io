# FROM jekyll/jekyll:stable
FROM gliderlabs/alpine:3.2

RUN apk-install bash build-base git libffi-dev zlib-dev libxml2-dev libxslt-dev ruby ruby-dev nodejs

# Install Jekyll
RUN gem install bundler jekyll --no-ri --no-rdoc

# Install nokogiri separately because it's special
RUN gem install nokogiri -v 1.6.7.2 -- --use-system-libraries

WORKDIR /src
ADD Gemfile /src/Gemfile
ADD Gemfile.lock /src/Gemfile.lock

RUN bundle config --global silence_root_warning 1
RUN bundle config build.nokogiri --use-system-libraries && \
    bundle check || bundle install && \
    bundle update

VOLUME /src

ENV BUNDLE_GEMFILE /src/Gemfile
ENV TIMEZONE  Europe/Copenhagen

EXPOSE 4000

ENTRYPOINT ["bundle", "exec"]
CMD ["jekyll","serve","--drafts","--incremental","--host=0.0.0.0"]
