FactoryBot.define do
  factory :recipe do
    name { 'MyString' }
    preparation_time { 1.2 }
    cooking_time { 1.5 }
    description { 'MyText' }
    public_recipe { true }
    user_id { 1 }
  end
end
