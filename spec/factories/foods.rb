FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "foodItem#{n}" }
    measurement_unit { 'g' }
    price { 2 }
    user_id { 1 }
  end
end
