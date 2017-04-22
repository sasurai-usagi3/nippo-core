module NippoCore
  class GroupMemberRelationsController < ApplicationController
    before_action :find_group

    def new
      @group_member_relations = @group.group_member_relations.new
    end

    # TODO: Implement test
    def create
      redirect_to home_path and return unless @group.member?(current_user)
      user = NippoCore::User.find(params[:group_member_relation][:user_id])
      @group.add_member(user)

      redirect_to group_path(@group)
    end
  end
end
