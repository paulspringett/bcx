require 'rapidash'
require 'bcx/version'

module Bcx
  autoload :Configuration, 'bcx/configuration'

  module Resources
    autoload :Todo, 'bcx/resources/todo'
    autoload :Todolist, 'bcx/resources/todolist'
    autoload :Project, 'bcx/resources/project'
  end

  autoload :Client, 'bcx/client'

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
