# ## Calendar Events
#
# Provides access to calendar events resoource and other nested resources
# Calendar Events are associated with either a Project, or with a user's
# Calendar. At present, only Project Calendar Events are implemented by this
# API client.
#
# #### Fetch upcoming calendar events for a given project
# `GET /projects/123/calendar_events.json`
#
#     client.projects(123).calendar_events!
#
# #### Fetch past calendar events for a given project
# `GET /projects/123/calendar_events/past.json`
#
#     client.projects(123).calendar_events.past!
#
# #### Fetch single calendar event for a given project with ID of 456
# `GET /projects/123/calendar_events/456.json`
#
#     client.projects(123).calendar_events!(456)
#
# #### Create a calendar event for a given project
# `POST /projects/123/calendar_events.json`
#
#     client.projects(123).calendar_events.create!(options)
#
# where `options` is a hash like the following,
#
# ```
#   {
#     "summary": "My single, all-day event",
#     "description": "Details to follow",
#     "all_day": true,
#     "starts_at": "2012-03-28"
#   }
# ```
#
# See the [New Basecamp API docs](https://github.com/basecamp/bcx-api/blob/master/sections/calendar_events.md#create-calendar-event) for more detailed exmaples.
#
# #### Update an existing calendar event for a given project
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
    class CalendarEvent < Rapidash::Base
      url :calendar_events
    end
  end
end
