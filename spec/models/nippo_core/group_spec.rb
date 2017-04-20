require 'rails_helper'

module NippoCore
  RSpec.describe Group, type: :model do
    describe 'Association' do
      it { should belong_to(:creator).class_name('NippoCore::User') }
    end

    describe 'Validation' do
      it { should validate_presence_of(:creator) }
      it { should validate_presence_of(:name) }
    end
  end
end
