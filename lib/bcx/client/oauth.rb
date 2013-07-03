module Bcx
  module Client
    class OAuth < Rapidash::Client
      method :oauth

      extension :json
      encode_request_with :json

      raise_errors

      resource :projects, class_name: 'Bcx::Resources::Project'
      resource :todolists, class_name: 'Bcx::Resources::Todolist'
      resource :people, class_name: 'Bcx::Resources::Person'

      def initialize(options = {})
        @account = Bcx.configuration.account
        @api_version = Bcx.configuration.api_version

        options[:site] = "https://basecamp.com/#{@account}/api/#{@api_version}"
        options[:uid] ||= options[:client_id]
        options[:secret] ||= options[:client_secret]

        super(options)
      end
    end
  end
end
