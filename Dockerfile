# Use the official lightweight Ruby image
FROM ruby:3.3.3-slim

LABEL maintainer="Yadi Rosadi <yrsdi.id@gmail.com>"

# Set environment variable
ENV APP_HOME=/app

# Create the app directory
WORKDIR $APP_HOME

# Install essential dependencies for Sinatra and development tools
RUN apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends \
    build-essential \
    vim \
    nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Bundler
RUN gem install bundler

# Copy the Gemfile and Gemfile.lock first (if exists)
COPY Gemfile* ./

# Install the gem dependencies
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose the port that Sinatra will run on
EXPOSE 4567

# Set the default command to run your Sinatra app
CMD ["bundle", "exec", "ruby", "app.rb", "-o", "0.0.0.0", "-p", "4567"]
