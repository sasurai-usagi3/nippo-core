require 'rails_helper'

module NippoCore
  RSpec.describe User, type: :model do
    describe 'Association' do
      it { should have_many(:created_groups).class_name('NippoCore::Group').with_foreign_key('creator_id').dependent(:destroy) }
      it { should have_many(:reports).dependent(:destroy) }
    end

    describe 'Validation' do
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:nickname) }
    end
  end
end
