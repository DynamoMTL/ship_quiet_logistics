# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ship_quiet_logistics/version'

Gem::Specification.new do |spec|
  spec.name          = 'ship_quiet_logistics'
  spec.version       = ShipQuietLogistics::VERSION
  spec.authors       = ['Hugo Bastien']
  spec.email         = ['hugobast@gmail.com']

  spec.summary       = %q{Ship to Quiet Logistics using Spree or Solidus}
  spec.description   = %q{TBA}
  spec.homepage      = 'https://github.com/DynamoMTL/ship_quiet_logistics'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'aws-sdk', '~> 1.66'
  spec.add_dependency 'nokogiri', '~> 1.6'
  spec.add_dependency 'spree_core', '~> 2.4'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'database_cleaner', '~> 1.5'
  spec.add_development_dependency 'dotenv', '~> 2.1'
  spec.add_development_dependency 'factory_girl', '~> 4.5'
  spec.add_development_dependency 'ffaker', '~> 1.16'
  spec.add_development_dependency 'pry', '~> 0.10.3'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec-rails', '~> 3.4'
  spec.add_development_dependency 'sqlite3', '~> 1.3'
end
