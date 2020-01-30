FROM ruby:2-alpine

RUN apk add --no-cache git
RUN gem install octokit

COPY lib /lib
ENTRYPOINT ["ruby", "/lib/main.rb"]
