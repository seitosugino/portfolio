FactoryBot.define do
  factory :customer do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password) { |n| "123456"}
  end
end
