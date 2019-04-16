FROM ruby:2.6.2-alpine3.9

RUN gem install octokit

COPY lib /lib

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
