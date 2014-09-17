ENV['RACK_ENV'] = 'test'
require 'webmock/rspec'
require 'vcr'
require 'active_support/all'
require 'pry'

require 'consul_api'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir['./spec/support/**/*.rb'].each { |f| require f }
ENV['CONSUL_IP'] = '127.0.0.1'
RSpec.configure do |config|

end
