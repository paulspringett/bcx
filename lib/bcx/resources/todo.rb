# ## Todo
#
# Provides access to todolist resoource both at the client level and per-project
#
# Get todos for a todolist
# `GET /todolists/1.json`
#
#     todolist = client.todolists!(1)
#     todolist.todos.remaining
#     todolist.todos.completed
#
# Get a specific todo
# `GET /projects/1/todos/2.json`
#
#     client.projects(1).todos!(2)
#
# Create a todo
# `POST /projects/1/todolists/2/todos.json`
#
#     client.projects(1).todolists(2).todos.create!(content: 'Update copy text')
#
# Update a todo
# `PUT /projects/1/todos/2.json`
#
#     client.projects(1).todos(2).update!(completed: true)
#
# Delete a todo
# `DELETE /projects/1/todos/2.json`
#
#     client.projects(1).todos(2).delete!
#
module Bcx
  module Resources
    class Todo < Rapidash::Base
    end
  end
end
