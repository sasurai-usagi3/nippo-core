require 'rails_helper'

module NippoCore
  RSpec.describe Group, type: :model do
    describe 'Association' do
      it { should belong_to(:creator).class_name('NippoCore::User') }
      it { should have_many(:reports).dependent(:destroy) }
      it { should have_many(:users).through(:group_member_relations) }
      it { should have_many(:group_member_relations).dependent(:destroy) }
    end

    describe 'Validation' do
      it { should validate_presence_of(:creator) }
      it { should validate_presence_of(:name) }
    end

    describe 'Methods' do
      let(:group) { create(:group) }
      let(:user) { create(:user) }

      describe '#member?' do
        subject { group.member?(user) }

        context 'userがメンバの時' do
          before do
            GroupMemberRelation.create(user: user, group: group, accepted_at: Time.now)
          end

          it { is_expected.to be_truthy }
        end

        context 'userが申請中の時' do
          before do
            GroupMemberRelation.create(user: user, group: group)
          end

          it { is_expected.to be_falsy }
        end

        context 'userがメンバでない時' do
          it { is_expected.to be_falsy }
        end
      end
    end
  end
end
