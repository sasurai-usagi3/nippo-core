FactoryGirl.define do
  factory :user, class: NippoCore::User do
    sequence(:email) { |n| "test#{n}@example.com" }
    password 'password'
    last_name 'unit'
    first_name 'test'
    nickname 'usagi'
  end
end
