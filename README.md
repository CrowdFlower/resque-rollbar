# Resque::Ratchetio

Adds Ratcherio as a failure backend to redis

## Installation

Add this line to your application's Gemfile:

    gem 'resque-ratchetio'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resque-ratchetio

## Usage


    require 'resque/failure/redis'
    require 'resque/failure/ratchetio'

    Resque::Failure::Multiple.classes = [Resque::Failure::Redis, Resque::Failure::Ratchetio]
    Resque::Failure.backend = Resque::Failure::Multiple

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
