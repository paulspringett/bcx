module Bcx
  module Resources

    # Bcx::Resources::Person
    # Provides access to people resource
    #
    # Get all people on the account
    # GET /people.json
    #
    #   client.people!
    #
    # Get a person
    # GET /people/123.json
    #
    #   client.people!(123)
    #
    # Get the current person
    # GET /people/me.json
    #
    #   client.people.me!
    #
    # Get todolists with assigned todos for a person
    # GET /people/1/assigned_todos.json
    #
    #   client.people(1).assigned_todos
    #
    # Delete a person
    # DELETE /people/123.json
    #
    #   client.people(123).delete!
    #
    class Person < Rapidash::Base
      url :people
      collection :me
    end
  end
end
