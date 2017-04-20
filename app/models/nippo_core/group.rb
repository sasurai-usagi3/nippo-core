module NippoCore
  class Group < ApplicationRecord
    belongs_to :creator, class_name: 'NippoCore::User'

    validates :creator, presence: true
    validates :name, presence: true
  end
end
