
FROM alpine:edge

RUN apk --update add \
      ca-certificates \
      ruby \
      make \
      build-base \
      zlib-dev \
      ruby-bundler \
      ruby-io-console \
      musl-dev \
      zlib zlib-dev \
      libxml2 libxml2-dev \
      libxslt libxslt-dev \
      ruby-dev \
      ruby-libs \
      libffi libffi-dev \
      nodejs && \
    rm -rf /var/cache/apk/*

WORKDIR /opt/middleman-app

CMD bundle exec puma -p 5000 config.ru

EXPOSE 5000

ADD Gemfile* /opt/middleman-app/

RUN bundle config build.nokogiri --use-system-libraries \
    && bundle install

ADD . /opt/middleman-app/

RUN bundle exec middleman build