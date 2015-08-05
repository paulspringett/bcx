module Bcx
  module Launchpad
    class OAuth < Rapidash::Client
      method :oauth

      extension :json
      encode_request_with :json

      raise_errors

      resource :authorization, class_name: "Bcx::Resources::Authorization"

      def initialize(options = {})
        # Adding base_url to be consistent with OAuth client
        base_url = options[:base_url] || "https://launchpad.37signals.com"
        options[:site]     ||= base_url
        options[:uid]      ||= options[:client_id]
        options[:secret]   ||= options[:client_secret]

        super(options)
      end
    end
  end
end
