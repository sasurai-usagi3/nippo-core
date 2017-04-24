module NippoCore
  class Group < ApplicationRecord
    belongs_to :creator, class_name: 'NippoCore::User'
    has_many :reports, dependent: :destroy
    has_many :users, through: :group_member_relations
    has_many :group_member_relations, dependent: :destroy

    validates :creator, presence: true
    validates :name, presence: true

    def member?(user)
      group_member_relations.where.not(accepted_at: nil).exists?(user_id: user.id)
    end

    # TODO: implement test
    def unaccepted_requests
      group_member_relations.where(accepted_at: nil).includes(:user)
    end

    # TODO: implement test
    def members
      NippoCore::User.joins(:group_member_relations)
                     .where(nippo_core_group_member_relations: {group_id: self.id})
                     .where.not(nippo_core_group_member_relations: {accepted_at: nil})
    end
  end
end
