# ## HTTP Client
# 
# Provides a client to access the Basecamp Next API using HTTP authentication
#
#
# Example:
#
#     client = Bcx::Client::HTTP.new(login: 'username', password: 'secret')
#
module Bcx
  module Client
    class HTTP < Rapidash::Client
      method :http

      extension :json
      encode_request_with :json

      raise_errors

      resource :projects, class_name: 'Bcx::Resources::Project'
      resource :todolists, class_name: 'Bcx::Resources::Todolist'
      resource :people, class_name: 'Bcx::Resources::Person'
      resource :attachments, class_name: 'Bcx::Resources::Attachment'

      def initialize(options = {})
        @account = Bcx.configuration.account
        @api_version = Bcx.configuration.api_version
        @user_agent = options[:user_agent] || Bcx.configuration.user_agent
        if @user_agent
          options[:request_default_options] ||= {}
          options[:request_default_options][:header] ||= {}
          options[:request_default_options][:header][:user_agent] ||= @user_agent
        end

        self.class.site("https://basecamp.com/#{@account}/api/#{@api_version}/")

        super(options)
      end
    end
  end
end
