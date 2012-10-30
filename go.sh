#!/bin/sh

# Ensure we're in the project directory
cd `dirname $0`

# Setup gems to install to userspace
export GEM_HOME=$HOME/.gems
export PATH=$GEM_HOME/bin:$PATH

# Output debug info in case a developer needs to lend a hand
echo "Working in `pwd`"
echo "Ruby `ruby -v`"
echo "Rubygems `gem -v`"

# Install bundler if not available
bundle -v 2>/dev/null || gem install bundler --no-rdoc --no-ri

# Install all gems (or update, after pulling new code)
bundle install

# Start services
bundle exec foreman start