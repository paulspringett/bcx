module Bcx
  class ResponseError < Rapidash::ResponseError

    def errors
      return body if body.kind_of?(String)

      messages = []

      body.each_pair do |attribute, msgs|
        msgs.each { |msg| messages.push "#{attribute} #{msg}" }
      end

      messages.join(', ')
    end

  end
end
