module Bcx
  module Resources

    # Get todolists with assigned todos for a person
    # GET /people/1/assigned_todos.json
    #
    #   client.people(1).assigned_todos
    #
    class Person < Rapidash::Base
    end
  end
end
