# ## Attachment
#
# Provides access to attachments
#
# #### Geta all attachments across all projects
# `GET /attachments.json`
#
#    client.attachments!
#
# #### Get all atatchments on a specific project
# `GET /projects/:project_id/attachments.json`
#
#     client.projects(123).attachments!
#
# #### Get a specific attachment
# `GET /projects/:project_id/attachments/:attachment_id.json`
#
#     client.project(123).attachments!(456)
#
# #### Rename an existing attachment
# `PUT /projects/:project_id/attachments/:attachment_id.json`
#
#     client.project(123).attachments(456).update!( name: "Updated name" )
#
# #### Delete an existing attachment
# `DELETE /projects/:project_id/attachments/:attachment_id.json`
#
#     client.project(123).attachments(456).delete!
#
module Bcx
  module Resources
    class Attachment < Rapidash::Base
    end
  end
end
