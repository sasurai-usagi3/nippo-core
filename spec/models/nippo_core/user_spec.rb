require 'rails_helper'

module NippoCore
  RSpec.describe User, type: :model do
    describe 'Validation' do
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:nickname) }
    end
  end
end
