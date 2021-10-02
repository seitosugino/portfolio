class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :customer_id, foreign_key: true
      t.references :tag_id, foreign_key: true

      t.string :title
      t.text :introduction
      t.string :title_image
      t.text :body
      t.string :body_image
      t.string :url
      t.text :original
      t.float :star

      t.timestamps
    end
  end
end
