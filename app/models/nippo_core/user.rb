module NippoCore
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    has_many :created_groups, class_name: 'NippoCore::Group', foreign_key: 'creator_id', dependent: :destroy
    has_many :reports, dependent: :destroy
    has_many :groups, through: :group_member_relations
    has_many :group_member_relations, dependent: :destroy

    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :nickname, presence: true
  end
end
