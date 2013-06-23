module Bcx
  module Resources

    # Bcx::Resources::Todolist
    # Provides access to todolist resoource both at the client level and per-project
    #
    # Get all todolists for a project
    # GET /projects/123/todolists.json
    #
    #     client.projects(123).todolists!
    #
    # Get all completed todolists for a project
    # GET /projects/1/todolists/completed.json
    #
    #     client.projects(123).todolists.completed!
    #
    # Get todolists for all projects
    # GET /todolists.json
    #
    #     client.todolists!
    #
    # Get completed todolists for all projects
    # GET /todolists/completed.json
    #
    #     client.todolists.completed!
    #
    # Get specific todolist including the todos
    # GET /projects/123/todolists/456.json
    #
    #     client.projects(123).todolists!(456)
    #
    # Create a new todolist
    # POST /projects/1/todolists.json
    #
    #     client.projects(123).todolists.create!(name: 'My todolist', description: 'This is a todolist')
    #
    # Update an existing todolist
    # PUT /projects/123/todolists/456.json
    #
    #     client.projects(123).todolists(456).update!(name: 'Updated todolist')
    #
    # Delete a todolist
    # DELETE /projects/123/todolists/456.json
    #
    #     client.projects(123).todolists(456).delete!
    #
    class Todolist < Rapidash::Base
      resource :todos, class_name: 'Bcx::Resources::Todo'

      collection :completed
    end
  end
end
