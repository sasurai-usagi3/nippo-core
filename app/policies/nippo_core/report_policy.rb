module NippoCore
  class ReportPolicy < ApplicationPolicy
    attr_reader :user, :group

    def initialize(user, report)
      @user = user
      @group = report.group
    end

    # TODO: remove
    def index?
      @group.member?(user)
    end

    def show?
      @group.member?(user)
    end

    def new?
      @group.member?(user)
    end

    def create?
      @group.member?(user)
    end
  end
end
