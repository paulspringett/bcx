module Bcx
  class Client < Rapidash::Client
    extension :json

    raise_errors

    resource :projects, class_name: 'Bcx::Resources::Project'
    resource :todolists, class_name: 'Bcx::Resources::Todolist'

    def initialize(auth_method, options = {})
      @account = Bcx.configuration.account
      @api_version = Bcx.configuration.api_version

      self.class.site("https://basecamp.com/#{@account}/api/#{@api_version}/")
      self.class.method(auth_method)

      options[:uid] ||= options[:client_id]
      options[:secret] ||= options[:client_secret]

      super(options)
    end

  end
end
