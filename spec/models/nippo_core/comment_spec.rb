require 'rails_helper'

module NippoCore
  RSpec.describe Comment, type: :model do
    describe 'Association' do
      it { should belong_to(:user) }
      it { should belong_to(:report) }
    end

    describe 'Validation' do
      it { should validate_presence_of(:user) }
      it { should validate_presence_of(:report) }
      it { should validate_presence_of(:body) }
    end
  end
end
