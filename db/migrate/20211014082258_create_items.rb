class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      #t.references :customer, foreign_key: true
      t.bigint :customer_id
      t.bigint :genre_id
      #t.references :genre, foreign_key: true
      t.string "name", null: false
      t.text "introduction", null: false
      t.integer "price", null: false
      t.boolean "is_active", default: true, null: false
      t.string "item_image_id", null: false
      t.string "url", null: false

      t.timestamps
    end
    add_foreign_key :items, :customers
    add_foreign_key :items, :genres
    add_index :items, :url, unique: true 
  end
end
