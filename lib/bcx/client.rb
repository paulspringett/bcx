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

      super(options)
    end

  end
end
