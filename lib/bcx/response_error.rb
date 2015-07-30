# ## Response Error
#
# If the response whilst fetching a resource is a 4xx or 5xx, Bcx will raise a `Bcx::ResponseError` exception.
#
# Examples:
#
#     client.projects.create!(name: '')
#     => Bcx::ResponseError: 422 POST https://basecamp.com/2274488/api/v1/projects.json | Errors: name can't be blank
#
# You can rescue this exception to grab the status, method, URL and errors individually.
#
#     begin
#       client.projects.create!(name: '')
#     rescue Bcx::ResponseError => response
#       response.method # => "POST"
#       response.status # => 422
#       response.url # => "https://basecamp.com/2274488/api/v1/projects.json"
#       response.errors # => ["name can't be blank"]
#     end
#
module Bcx
  class ResponseError < Rapidash::ResponseError

    def errors
      return body if body.kind_of?(String)

      messages = []

      body.each_pair do |attribute, msgs|
        if msgs.respond_to? :each
          msgs.each { |msg| messages.push "#{attribute} #{msg}" }
        else
          messages.push "#{attribute} #{msgs.to_s}"
        end
      end

      messages.join(', ')
    end

  end
end
