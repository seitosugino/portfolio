FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "TEST"}
    sequence(:introduction) { |n| "TEST"}
    sequence(:item_image_id) { |n| open('./app/assets/images/no_image.jpg')}
    sequence(:price) { |n| 500}
    sequence(:url) { |n| "TEST"}
    sequence(:customer_id) { |n| 1}
    sequence(:genre_id) { |n| 1}
  end
end
