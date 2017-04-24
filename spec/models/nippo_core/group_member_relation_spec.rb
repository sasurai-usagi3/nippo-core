require 'rails_helper'

module NippoCore
  RSpec.describe GroupMemberRelation, type: :model do
    describe 'Association' do
      it { should belong_to(:user) }
      it { should belong_to(:group) }
      it { should belong_to(:accepter).class_name('NippoCore::User') }
    end

    describe 'Validation' do
      it { should validate_presence_of(:user) }
      it { should validate_presence_of(:group) }
      it { should validate_presence_of(:authentication) }
    end
  end
end
