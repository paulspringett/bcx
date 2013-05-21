require 'rapidash'
require 'bcx/version'

module Bcx
  autoload :Configuration, 'bcx/configuration'
  autoload :Client, 'bcx/client'

  module Resources
    autoload :Project, 'bcx/resources/project'
    autoload :Todolist, 'bcx/resources/todolist'
    autoload :Todo, 'bcx/resources/todo'
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
