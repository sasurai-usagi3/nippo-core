module NippoCore
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
      @created_groups = current_user.created_groups.order(created_at: :desc).limit(5)
      @joined_groups = current_user.joined_groups.order(created_at: :desc).limit(5)
      @requesting_groups = current_user.requesting_groups.order(created_at: :desc).limit(5)
    end
  end
end
