require 'rapidash'
require 'bcx/version'

module Bcx
  autoload :Configuration, 'bcx/configuration'

  module Resources
    autoload :Todo, 'bcx/resources/todo'
    autoload :Todolist, 'bcx/resources/todolist'
    autoload :Project, 'bcx/resources/project'
  end

  module Client
    autoload :HTTP, 'bcx/client/http'
    autoload :OAuth, 'bcx/client/oauth'
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end

require 'bcx/response_error'
Rapidash.response_exception_class = Bcx::ResponseError
