FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "TEST"}
    sequence(:introduction) { |n| "TEST"}
    sequence(:title_image_id) { |n| open('./app/assets/images/no_image.jpg')}
    sequence(:body) { |n| 500}
    sequence(:body_image_id) { |n| open('./app/assets/images/no_image.jpg')}
    sequence(:url) { |n| "TEST"}
    sequence(:star) { |n| 1}
    sequence(:customer_id) { |n| 1}
    sequence(:category_id) { |n| 1}
  end
end