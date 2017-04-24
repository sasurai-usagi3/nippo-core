module NippoCore
  module Groups
    class UsersController < ApplicationController
      before_action :find_group

      def unaccepted
        @requests = @group.unaccepted_requests.limit(5)
      end
    end
  end
end
