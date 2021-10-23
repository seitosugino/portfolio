class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      #t.references :customer,type: :bigint, foreign_key: true
      t.bigint :customer_id
      t.bigint :category_id
      #t.references :category,type: :bigint, foreign_key: true

      t.string :title
      t.text :introduction
      t.string :title_image_id
      t.text :body
      t.string :body_image_id
      t.string :url
      t.float :star

      t.timestamps
    end
    add_foreign_key :posts, :customers
    add_foreign_key :posts, :categories
  end
end
