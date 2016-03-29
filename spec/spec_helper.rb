ENV['RAILS_ENV'] = 'test'

begin
  require File.expand_path('../dummy/config/environment', __FILE__)
rescue LoadError
  puts 'Could not load dummy application. Please ensure you have run `bundle exec rake test_app`'
  exit
end

require 'ship_quiet_logistics'
require 'database_cleaner'
require 'ffaker'
require 'pry'
require 'rspec/rails'

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

require 'spree/testing_support/factories'

ShipQuietLogistics.configure do |config|
  config.outgoing_bucket  = :outgoing_bucket
  config.outgoing_queue   = :outgoing_queue
  config.business_unit    = :business_unit
  config.client_id        = :client_id
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.use_transactional_fixtures = false
end
