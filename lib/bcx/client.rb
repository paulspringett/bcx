module Bcx
  class Client < Rapidash::Client
    @account = Bcx.configuration.account
    @api_version = Bcx.configuration.api_version

    site "https://basecamp.com/#{@account}/api/#{@api_version}/"
    extension :json

    resource :projects, class_name: 'Bcx::Resources::Project'
    resource :todolists, class_name: 'Bcx::Resources::Todolist'

    def initialize(auth_method, options = {})
      self.class.method(auth_method)
      super(options)
    end

  end
end
