require 'rails_helper'

RSpec.describe NippoCore::ReportPolicy do
  let(:report) { create(:report) }
  let(:user) { report.user }
  let(:group) { report.group }

  subject { described_class }

  shared_examples 'userがグループの一員' do
    before do
      NippoCore::GroupMemberRelation.create(user: user, group: group, accepted_at: Time.now)
    end
    it { is_expected.to permit(user, report) }
  end
  shared_examples 'userがグループの承認待ち中' do
    before do
      NippoCore::GroupMemberRelation.create(user: user, group: group)
    end
    it { is_expected.not_to permit(user, report) }
  end
  shared_examples 'userがグループメンバでない' do
    it { is_expected.not_to permit(user, report) }
  end

  permissions :index?, :show?, :new?, :create? do
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

  permissions :edit?, :update? do
    context 'reportがuserのもの' do
      it { is_expected.to permit(user, report) }
    end
    context 'reportがuserのものでない' do
      let(:user2) { create(:user) }
      it { is_expected.not_to permit(user2, report) }
    end
  end

  permissions :destroy? do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end
