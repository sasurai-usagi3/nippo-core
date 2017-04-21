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
      let(:group) { create(:group) }
      let(:user) { create(:user) }

      describe '#add_member' do

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

      describe '#member?' do
        subject { group.member?(user) }

        context 'userがメンバの時' do
          before do
            GroupMemberRelation.create(user: user, group: group, status: true)
          end

          it { is_expected.to be_truthy }
        end

        context 'userが申請中の時' do
          before do
            GroupMemberRelation.create(user: user, group: group, status: false)
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
