module Bcx

  # Bcx::Configuration
  # Provides a configuration block for setting up the Bcx client
  # Example:
  #
  #   Bcx.configure do |config|
  #     config.account = '1234567890'
  #   end
  #
  class Configuration
    attr_accessor :account, :api_version

    def initialize
      @api_version = 'v1'
    end
  end
end
