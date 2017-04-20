module NippoCore
  class Group < ApplicationRecord
    belongs_to :creator, class_name: 'NippoCore::User'
    has_many :reports, dependent: :destroy

    validates :creator, presence: true
    validates :name, presence: true
  end
end
