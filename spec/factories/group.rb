FactoryBot.define do
  factory :group do
    sequence(:name) { |n| "TEST"}
    sequence(:introduction) { |n| "TEST"}
    sequence(:image_id) { |n| open('./app/assets/images/no_image.jpg')}
    sequence(:owner_id) { |n| 1}
  end
end