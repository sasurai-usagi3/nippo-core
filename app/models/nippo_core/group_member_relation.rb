module NippoCore
  class GroupMemberRelation < ApplicationRecord
    belongs_to :user
    belongs_to :group
    # TODO: reflect test to optional
    belongs_to :accepter, class_name: 'NippoCore::User', optional: true

    validates :user, presence: true
    validates :group, presence: true
    validates :authentication, presence: true
  end
end
