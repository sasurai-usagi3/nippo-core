FactoryGirl.define do
  factory :report, class: NippoCore::Report do
    user { create(:user) }
    group { create(:group) }
    body 'a'
    reported_at { Date.today }
  end
end
