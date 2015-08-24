require 'rapidash'
require 'bcx/version'

# ## Bcx
# Fully-fledged Ruby API wrapper for Basecamp Next
#
# See the [README](https://github.com/paulspringett/bcx#readme) for usage
#
module Bcx
  autoload :Configuration, 'bcx/configuration'

  module Resources
    autoload :Todo, 'bcx/resources/todo'
    autoload :Todolist, 'bcx/resources/todolist'
    autoload :Project, 'bcx/resources/project'
    autoload :Person, 'bcx/resources/person'
    autoload :Access, 'bcx/resources/access'
    autoload :Authorization, 'bcx/resources/authorization'
    autoload :Comment, 'bcx/resources/comment'
    autoload :Attachment, 'bcx/resources/attachment'
  end

  module Client
    autoload :HTTP, 'bcx/client/http'
    autoload :OAuth, 'bcx/client/oauth'
  end

  module Launchpad
    autoload :OAuth, 'bcx/launchpad/oauth'
  end

  class << self
    attr_writer :configuration
  end

  # Create configuration block in case the user does not call configure
  def self.configuration
    self.class.instance_variable_set('@configuration',Configuration.new) if self.class.instance_variable_get('@configuration').nil?
    self.class.instance_variable_get('@configuration')
  end

  # Expose configuration block
  def self.configure
    yield(configuration)
  end
end

# Use custom `Bcx::ResponseError` on top of Rapidash's error handling
require 'bcx/response_error'
Rapidash.response_exception_class = Bcx::ResponseError
