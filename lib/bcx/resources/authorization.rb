module Bcx
  module Resources

    # Bcx::Resources::Authorization
    # Provides access to the authorization resource
    #
    # Fetch authorization
    # GET /authorization.json
    #
    #   launchpad.authorization!
    #
    class Authorization < Rapidash::Base
      url :authorization
    end
  end
end
