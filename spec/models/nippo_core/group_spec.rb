require 'rails_helper'

module NippoCore
  RSpec.describe Group, type: :model do
    describe 'Association' do
      it { should belong_to(:creator).class_name('NippoCore::User') }
      it { should have_many(:reports).dependent(:destroy) }
      it { should have_many(:members).through(:group_member_relations).source(:user) }
      it { should have_many(:group_member_relations).dependent(:destroy) }
    end

    describe 'Validation' do
      it { should validate_presence_of(:creator) }
      it { should validate_presence_of(:name) }
    end

    describe 'Methods' do
      describe '#add_member' do
        let(:group) { create(:group) }
        let(:user) { create(:user) }

        context '申請が出ている時' do
          before do
            NippoCore::GroupMemberRelation.create(user: user, group: group)
          end

          it 'memberの追加を承認すること' do
            group.add_member(user)
            expect(NippoCore::GroupMemberRelation.first.status).to be_truthy
          end
        end

        context '申請が出ていない時' do
          it 'memberを追加できること' do
            expect { group.add_member(user) }.to change(NippoCore::GroupMemberRelation, :count).by(1)
            expect(NippoCore::GroupMemberRelation.first.status).to be_truthy
          end
        end
      end
    end
  end
end
