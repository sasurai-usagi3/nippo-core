module NippoCore
  class ReportPolicy < ApplicationPolicy
    attr_reader :user, :group, :report

    def initialize(user, report)
      @user = user
      @report = report
      @group = @report.group
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

    def edit?
      @report.user_id == @user.id
    end

    def update?
      @report.user_id == @user.id
    end
  end
end
