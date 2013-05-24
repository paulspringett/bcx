require 'simplecov'
SimpleCov.start

require 'vcr'
VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :faraday
  c.default_cassette_options = { record: :new_episodes }
end

require 'bcx'

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros

  config.before(:each) do
    # Set to test account
    Bcx.configure { |config| config.account = '2274488' }
  end
end
