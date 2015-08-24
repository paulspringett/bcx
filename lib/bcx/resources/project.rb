# ## Projects
#
# Provides access to projects resoource and other nested resources
#
# #### Fetch all projects
# `GET /projects.json`
#
#     client.projects!
#
# #### Fetch archived projects
# `GET /projects/archived.json`
#
#     clients.projects.archived!
#
# #### Fetch single project with ID of 123
# `GET /projects/123.json`
#
#     client.projects!(123)
#
# #### Create a project
# `POST /projects.json`
#
#     client.projects.create!(name: 'Acme project', description: 'This is a new project')
#
# #### Update an existing project
# `PUT /projects/123.json`
#
#     client.projects(123).update!(description: 'A new description')
#
# #### Delete a project
# `DELETE /projects/123.json`
#
#     client.projects(123).delete!
#
module Bcx
  module Resources
    class Project < Rapidash::Base
      resource :todolists
      resource :todos
      resource :accesses
      resource :comments
      resource :attachments

      collection :archived
    end
  end
end
