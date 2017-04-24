module NippoCore
  class GroupMemberRelationsController < ApplicationController
    before_action :find_group, except: :accept

    def new
      @group_member_relations = @group.group_member_relations.new
    end

    # TODO: Implement test
    def create
      redirect_to home_path and return unless @group.member?(current_user)
      user = NippoCore::User.find(params[:group_member_relation][:user_id])
      current_user.add_member(user, @group)

      redirect_to group_path(@group)
    end

    def accept
      @request = NippoCore::GroupMemberRelation.find(params[:group_member_relation_id])
      current_user.accept_request(@request)

      render layout: nil
    end

    def unaccepted
      @requests = @group.unaccepted_requests.limit(5)
    end
  end
end
