module Bcx
  module Resources

    # Bcx::Resources::Todolist
    # Provides access to todolist resoource both at the client level and per-project
    #
    # Get all todolists for a project
    # GET /projects/123/todolists.json
    #
    #   client.projects(123).todolists!
    #
    # Get all completed todolists for a project
    # GET /projects/1/todolists/completed.json
    #
    #   client.projects(123).todolists.completed!
    #
    # Get todolists for all projects
    # GET /todolists.json
    #
    #   client.todolists!
    #
    # Get completed todolists for all projects
    # GET /todolists/completed.json
    #
    #   client.todolists.completed!
    #
    class Todolist < Rapidash::Base
      root :todolist

      resource :todos, class_name: 'Bcx::Resources::Todo'

      def completed!
        @url += '/completed'
        @call!
      end
    end
  end
end
