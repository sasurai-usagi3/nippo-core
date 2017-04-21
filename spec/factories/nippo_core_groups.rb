FactoryGirl.define do
  factory :group, class: NippoCore::Group do
    name 'テストグループ'
    creator { create(:user) }
  end
end
