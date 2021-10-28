FactoryBot.define do
  factory :order do
    sequence(:customer_id) { |n| 1}
    sequence(:postal_code) { |n| 1234567}
    sequence(:address) { |n| 1}
    sequence(:name) { |n| 1}
    sequence(:shipping_cost) { |n| 1}
    sequence(:total_payment) { |n| 1}
    sequence(:payment_method) { |n| 0}
    sequence(:status) { |n| 1}
  end
end
