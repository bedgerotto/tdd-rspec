FactoryBot.define do
  factory :category do
    description { Faker::Commerce.product_name }
  end
end
