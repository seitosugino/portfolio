FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "#{n}"}
  end
end