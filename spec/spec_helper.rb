require 'simplecov'
SimpleCov.start

require 'bcx'

RSpec.configure do |config|
  config.before(:each) do

    # Dummy configuration to prevent errors
    Bcx.configure do |config|
      config.account = '123456'
    end

  end
end
