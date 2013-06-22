require 'rapidash'
require 'bcx/version'

# # Bcx
# Fully-fledged Ruby API wrapper for Basecamp Next
#
#  See the [README](https://github.com/paulspringett/bcx#readme) for usage
#
module Bcx
  autoload :Configuration, 'bcx/configuration'

  module Resources
    autoload :Todo, 'bcx/resources/todo'
    autoload :Todolist, 'bcx/resources/todolist'
    autoload :Project, 'bcx/resources/project'
    autoload :Person, 'bcx/resources/person'
  end

  module Client
    autoload :HTTP, 'bcx/client/http'
    autoload :OAuth, 'bcx/client/oauth'
  end

  class << self
    attr_accessor :configuration
  end

  # Expose configuration block
  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end

# Use custom `Bcx::ResponseError` on top of Rapidash's error handling
require 'bcx/response_error'
Rapidash.response_exception_class = Bcx::ResponseError
