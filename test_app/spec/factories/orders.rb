FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Pedido #{n}" }
    association :customer, factory: :customer_male_vip
  end
end
