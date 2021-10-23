class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :customer, foreign_key: true
      t.references :category, foreign_key: true

      t.string :title
      t.text :introduction
      t.string :title_image_id
      t.text :body
      t.string :body_image_id
      t.string :url
      t.float :star

      t.timestamps
    end
  end
end
