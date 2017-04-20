module NippoCore
  class Report < ApplicationRecord
    belongs_to :user
    belongs_to :group

    validates :user, presence: true
    validates :group, presence: true
    validates :reported_at, presence: true
    validates :body, presence: true
  end
end
