module NippoCore
  class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :report

    validates :user, presence: true
    validates :report, presence: true
    validates :body, presence: true
  end
end
