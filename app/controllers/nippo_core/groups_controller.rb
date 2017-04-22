module NippoCore
  class GroupsController < ApplicationController
    before_action :initialize_group, only: [:new, :create]

    def index
      @groups = NippoCore::Group.order(created_at: :desc).page(params[:page]).per(10)
    end

    def new
    end

    def show
      @group = NippoCore::Group.find(params[:id])
      @reports = @group.reports.order(reported_at: :desc).limit(5)
    end

    def create
      if @group.save
        @group.add_member(current_user)
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
