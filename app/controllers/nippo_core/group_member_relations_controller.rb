module NippoCore
  class GroupMemberRelationsController < ApplicationController
    before_action :find_group

    def new
      @group_member_relations = @group.group_member_relations.new
    end

    def create
      user = NippoCore::User.find(params[:group_member_relation][:user_id])
      @group.add_member(user)

      redirect_to group_path(@group)
    end
  end
end
