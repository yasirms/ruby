FROM ruby:2.6.3


RUN apt-get update -qq && gem install rails && apt-get install -y nodejs postgresql-client
RUN gem install bundler
WORKDIR /web
COPY web .
COPY web/Gemfile ./Gemfile
#RUN apt-get install -y redis
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000:3000

# Configure the main process to run when running the image
CMD ["bundle" "exec" "rails", "server", "--binding", "0.0.0.0"]

RUN /bin/bash
