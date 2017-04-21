module NippoCore
  class GroupMemberRelation < ApplicationRecord
    belongs_to :user
    belongs_to :group

    validates :user, presence: true
    validates :group, presence: true
    validates :authentication, presence: true
  end
end
