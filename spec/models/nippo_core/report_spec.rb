require 'rails_helper'

module NippoCore
  RSpec.describe Report, type: :model do
    describe 'Association' do
      it { should belong_to(:user) }
      it { should belong_to(:group) }
    end

    describe 'Validation' do
      it { should validate_presence_of(:user) }
      it { should validate_presence_of(:group) }
      it { should validate_presence_of(:reported_at) }
      it { should validate_presence_of(:body) }
    end
  end
end
