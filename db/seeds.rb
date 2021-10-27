# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: '123456', password_confirmation: '123456') if Rails.env.development?

Customer.create!(email: 'a@a', password: '123456', password_confirmation: '123456', name: '管理者', introduction: 'テスト', role: 'true') 
Customer.create!(email: 't@t', password: '123456', password_confirmation: '123456', name: 'テスト', introduction: 'テスト', role: 'false') 

Genre.create!(name: '周辺機器')
Genre.create!(name: 'DIY')
Genre.create!(name: 'その他')

item = Item.create!(customer_id: 1,genre_id: 1,name: 'tesuto',introduction: 'tesuto', price: 500, is_active: true, url: 'tesuto', item_image_id: open('./app/assets/images/no_image.jpg'))
File.open("./app/assets/images/no_image.jpg") do |file|
  item.item_image = file
end
item.item_image_id = item.item_image.id
item.save

item = Item.create!(customer_id: 2, genre_id: 2,name: 'tesuto2',introduction: 'tesuto', price: 1000, is_active: true, url: 'tesuto', item_image_id: open('./app/assets/images/no_image.jpg'))
File.open("./app/assets/images/no_image.jpg") do |file|
  item.item_image = file
end
item.item_image_id = item.item_image.id
item.save

Category.create!(id: '1',name: 'プログラミング')
Category.create!(id: '2',name: 'ガジェット')
Category.create!(id: '3',name: '生活')
Category.create!(id: '4',name: 'ニュース')
Category.create!(id: '5',name: 'その他')


array = %w(スマートフォン パソコン イヤホン 料理 CSS Python Rails)
array.each{ |tag|
  tag_list = ActsAsTaggableOn::Tag.new
  tag_list.name = tag
  tag_list.save
}