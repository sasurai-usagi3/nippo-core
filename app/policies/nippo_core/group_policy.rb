module NippoCore
  class GroupPolicy < ApplicationPolicy
    attr_reader :user, :group

    def initialize(user, group)
      @user = user
      @group = group
    end

    def edit?
      @group.member?(user)
    end

    def update?
      @group.member?(user)
    end
  end
end
