module NippoCore
  class GroupsController < ApplicationController
    before_action :authenticate_user!
    before_action :initialize_group, only: [:new, :create]

    def new
    end

    def create
      if @group.save
        redirect_to root_path
      else
        render 'new', status: 400
      end
    end

  private
    def initialize_group
      @group = NippoCore::Group.new(group_params.merge(creator: current_user))
    end

    def group_params
      params.fetch(:group, {}).permit(:name, :description)
    end
  end
end
