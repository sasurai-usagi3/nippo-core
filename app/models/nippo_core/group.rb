module NippoCore
  class Group < ApplicationRecord
    belongs_to :creator, class_name: 'NippoCore::User'
    has_many :reports, dependent: :destroy
    has_many :members, through: :group_member_relations, source: :user
    has_many :group_member_relations, dependent: :destroy

    validates :creator, presence: true
    validates :name, presence: true

    def add_member(user)
      relation = group_member_relations.find_or_initialize_by(user: user, status: false)
      relation.status = true
      relation.save
    end

    def member?(user)
      group_member_relations.exists?(user_id: user.id, status: true)
    end
  end
end
