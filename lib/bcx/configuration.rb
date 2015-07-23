# ## Configuration
#
# Provides a configuration block for setting up the Bcx client
#
# Example:
#
#     Bcx.configure do |config|
#       config.account = '1234567890'
#     end
#
module Bcx
  class Configuration
    attr_accessor :account, :api_version, :user_agent

    def initialize
      @api_version = 'v1'
    end
  end
end
