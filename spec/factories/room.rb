FactoryBot.define do
  factory :room do
    sequence(:name) { |n| "#{n}"}
  end
end