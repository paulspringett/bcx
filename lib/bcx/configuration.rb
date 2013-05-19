module Bcx
  class Configuration
    attr_accessor :account, :api_version

    def initialize
      @api_version = 'v1'
    end
  end
end
