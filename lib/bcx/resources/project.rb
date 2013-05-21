module Bcx
  module Resources
    class Project < Rapidash::Base
      root :project

      resource :todolists, class_name: 'Bcx::Resources::Todolist'

      def archived!
        @url += '/archived'
        call!
      end
    end
  end
end
