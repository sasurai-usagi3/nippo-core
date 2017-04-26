require 'rails_helper'

module NippoCore
  RSpec.describe User, type: :model do
    describe 'Association' do
      it { should have_many(:created_groups).class_name('NippoCore::Group').with_foreign_key('creator_id').dependent(:destroy) }
      it { should have_many(:reports).dependent(:destroy) }
      it { should have_many(:group_member_relations).dependent(:destroy) }
    end

    describe 'Validation' do
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:nickname) }
    end

    describe 'methods' do
      let(:user) { create(:user) }
      let(:group) { create(:group) }

      describe '#send_request' do
        subject { user.send_request(group) }

        context '申請を出していないとき' do
          it { expect { subject }.to change(NippoCore::GroupMemberRelation, :count).by(1) }
        end

        context '申請を出したとき' do
          before do
            NippoCore::GroupMemberRelation.create(user: user, group: group)
          end

          it { expect { subject }.to change(NippoCore::GroupMemberRelation, :count).by(0) }
        end
      end

      describe '#add_member' do
        let(:user2) { create(:user) }

        context '申請が出ている時' do
          before do
            NippoCore::GroupMemberRelation.create(user: user2, group: group)
          end

          it 'memberの追加を承認すること' do
            expect { user.add_member(user2, group) }.to change(NippoCore::GroupMemberRelation, :count).by(0)
            expect(NippoCore::GroupMemberRelation.last.accepted_at).to be_present
          end
        end

        context '申請が出ていない時' do
          it 'memberを追加できること' do
            expect { user.add_member(user2, group) }.to change(NippoCore::GroupMemberRelation, :count).by(1)
            expect(NippoCore::GroupMemberRelation.last.accepted_at).to be_present
          end
        end
      end

      describe '#accept_request' do
        let(:user2) { create(:user) }
        let(:request) { NippoCore::GroupMemberRelation.create(user: user2, group: group) }

        context 'userがメンバーの時' do
          before do
            NippoCore::GroupMemberRelation.create(user: user, group: group, accepted_at: Time.now)
          end

          it '申請を受理すること' do
            user.accept_request(request)
            expect(NippoCore::GroupMemberRelation.last.accepted_at).to be_present
          end
        end
        context 'userがメンバーでない時' do
          it '申請を受理しないこと' do
            user.accept_request(request)
            expect(NippoCore::GroupMemberRelation.last.accepted_at).to be_nil
          end
        end
      end

      describe '#request_to?' do
        subject { user.request_to?(group) }

        context '申請を出していないとき' do
          it { is_expected.to be_falsy }
        end

        context '申請を出したとき' do
          before do
            NippoCore::GroupMemberRelation.create(user: user, group: group)
          end

          it { is_expected.to be_truthy }
        end
      end
    end
  end
end
