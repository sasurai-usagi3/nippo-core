module NippoCore
  class GroupsController < ApplicationController
    include Pundit

    before_action :initialize_group, only: [:new, :create]
    before_action :find_group, except: [:index, :new, :create]

    def index
      @groups = NippoCore::Group.order(created_at: :desc).page(params[:page]).per(10)
    end

    def new
    end

    def show
      @reports = @group.reports.order(reported_at: :desc).limit(5)
      @requests = @group.unaccepted_requests.limit(5)
      @members = @group.members
    end

    def create
      if @group.save
        current_user.add_member(current_user, @group)
        redirect_to root_path
      else
        render 'new', status: 400
      end
    end

    def edit
      authorize @group
      render layout: nil
    end

    def update
      authorize @group
      if @group.update(group_params)
        redirect_to @group
      else
        head 400
      end
    end

    def request_join
      result = current_user.send_request(@group)
      render layout: nil
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
