module Bcx
  module Resources

    # Bcx::Resources::Project
    # Provides access to projects resoource and other nested resources
    # Examples:
    #
    #   # Fetch all projects
    #   client.projects!
    #
    #   # Fetch archived projects
    #   clients.projects.archived!
    #
    #   # Fetch single project with ID of 123
    #   client.projects!(123)
    #
    class Project < Rapidash::Base
      root :project

      resource :todolists, class_name: 'Bcx::Resources::Todolist'
      resource :todos, class_name: 'Bcx::Resources::Todo'

      def archived!
        @url += '/archived'
        call!
      end
    end
  end
end
