# ## Comments
#
# Provides access to comments resource on todo or todolist level
#
# #### Create a new todolist comment
# `POST /projects/123/todolist/456/comments.json`
#
#     client.projects(123).todolists(456).comments.create!(content: 'New comment')
#
# #### Create a new todo comment
# `POST /projects/123/todo/456/comments.json`
#
#     client.projects(123).todos(456).comments.create!(content: 'New comment')
#
# #### Create a new calendar event comment
# `POST /projects/123/calendar_events/456/comments.json`
#
#     client.projects(123).calendar_events(456).comments.create!(content: 'New comment')
#
# #### Delete the comment
# `DELETE /projects/123/comments/456.json`
#
#     client.projects(123).comments(456).delete!
#
module Bcx
  module Resources
    class Comment < Rapidash::Base
    end
  end
end
