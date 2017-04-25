require 'rails_helper'

RSpec.describe NippoCore::GroupPolicy do
  let(:user) { create(:user) }
  let(:group) { create(:group) }

  subject { described_class }

  shared_examples 'userがグループの一員' do
    before do
      NippoCore::GroupMemberRelation.create(user: user, group: group, accepted_at: Time.now)
    end
    it { is_expected.to permit(user, group) }
  end
  shared_examples 'userがグループの承認待ち中' do
    before do
      NippoCore::GroupMemberRelation.create(user: user, group: group)
    end
    it { is_expected.not_to permit(user, group) }
  end
  shared_examples 'userがグループメンバでない' do
    it { is_expected.not_to permit(user, group) }
  end

  permissions :edit?, :update? do
    context 'userがグループの一員' do
      it_behaves_like 'userがグループの一員'
    end
    context 'userがグループの承認待ち中' do
      it_behaves_like 'userがグループの承認待ち中'
    end
    context 'userがグループメンバでない' do
      it_behaves_like 'userがグループメンバでない'
    end
  end
end
