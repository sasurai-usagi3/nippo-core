module NippoCore
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    has_many :created_groups, class_name: 'NippoCore::Group', foreign_key: 'creator_id', dependent: :destroy
    has_many :reports, dependent: :destroy
    has_many :group_member_relations, dependent: :destroy

    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :nickname, presence: true

    def send_request(group)
      relation = group_member_relations.find_or_initialize_by(group: group)
      relation.save
    end

    # TODO: had better check!
    def add_member(user, group)
      relation = group.group_member_relations.find_or_initialize_by(user: user, accepted_at: nil)
      relation.accepted_at = Time.now
      relation.accepter = self
      relation.save
    end

    def accept_request(request)
      return unless request.group.member?(self)
      request.accepted_at = Time.now
      request.accepter = self
      request.save
    end

    def request_to?(group)
      group_member_relations.exists?(group_id: group.id)
    end

    # TODO: implement test
    def joined_groups
      NippoCore::Group.joins(:group_member_relations)
                      .where(nippo_core_group_member_relations: {user_id: id})
                      .where.not(nippo_core_group_member_relations: {accepted_at: nil})
    end

    # TODO: implement test
    def requesting_groups
      NippoCore::Group.joins(:group_member_relations)
                      .where(nippo_core_group_member_relations: {user_id: id, accepted_at: nil})
    end
  end
end
