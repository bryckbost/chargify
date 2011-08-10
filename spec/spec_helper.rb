require "chargify"
require "webmock/rspec"

RSpec.configure do |config|
  config.before do
    Chargify.reset
    Chargify.instance_variable_set(:@client, nil)
  end
end
