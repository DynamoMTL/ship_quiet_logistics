# ShipQuietLogistics

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/ship_quiet_logistics`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ship_quiet_logistics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ship_quiet_logistics

## Configuration

WIP: Quiet Logistics uses S3 buckets and SQS queues for it's operations. Some ENV variables will need to be set.

```ruby
ENV['AWS_ACCESS_KEY_ID']
ENV['AWS_SECRET_ACCESS_KEY']
ENV['QUIET_INCOMING_QUEUE']
ENV['QUIET_INCOMING_BUCKET']
ENV['QUIET_OUTGOING_QUEUE']
ENV['QUIET_OUTGOING_BUCKET']
```

Additionnaly Quiet Logistics requires a Business Unit and a Client ID

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ship_quiet_logistics. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

