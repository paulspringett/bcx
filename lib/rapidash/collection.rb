module Rapidash
  module Collection

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def collection(name, attrs = {})
        path = attrs[:path] || name.to_s
        path.gsub!(/^\//, '')

        method = attrs[:method] || :get

        define_method("#{name}!") do
          original_url = @url

          @url += "/#{path}"
          @options[:method] = method
          result = call!

          @url = original_url

          result
        end
      end
    end
  end
end

class Rapidash::Base
  include Rapidash::Collection
end
