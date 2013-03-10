# Resque::Rollbar

Adds Rollbar as a failure backend to redis

## Installation

Add this line to your application's Gemfile:

    gem 'resque-rollbar', git: "git://github.com/CrowdFlower/resque-ratchetio.git"

And then execute:

    $ bundle

## Usage


    require 'resque/failure/redis'
    require 'resque/failure/rollbar'
    require 'resque/failure/multiple'

    Resque::Failure::Multiple.classes = [Resque::Failure::Redis, Resque::Failure::Rollbar]
    Resque::Failure.backend = Resque::Failure::Multiple

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
