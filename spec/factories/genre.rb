FactoryBot.define do
  factory :genre do
    sequence(:name) { |n| "#{n}"}
  end
end
