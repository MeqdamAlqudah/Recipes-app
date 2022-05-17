FactoryBot.define do
  factory :user do
    name { 'MyString' }
    sequence(:email) { |n| "#{name.downcase}#{n}@test.com" }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { DateTime.now }
  end
end
