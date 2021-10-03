# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: '123456', password_confirmation: '123456') if Rails.env.development?

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