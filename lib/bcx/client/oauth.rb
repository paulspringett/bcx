# ## Oauth Client
# 
# Provides a client to access the Basecamp Next API via OAuth credentials
#
# Example:
#
#     client = Bcx::Client::OAuth.new(client_id: '1234567890', client_secret: '831994c4170', access_token: 'b02ff9345c3')
#
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
        @account = options[:account] || Bcx.configuration.account
        @api_version = Bcx.configuration.api_version
        @user_agent = options[:user_agent] || Bcx.configuration.user_agent

        options[:site] = "https://basecamp.com/#{@account}/api/#{@api_version}"
        options[:uid] ||= options[:client_id]
        options[:secret] ||= options[:client_secret]

        if @user_agent
          options[:request_default_options] ||= {}
          options[:request_default_options][:header] ||= {}
          options[:request_default_options][:header][:user_agent] ||= @user_agent
        end

        super(options)
      end
    end
  end
end
