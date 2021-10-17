class CreateItemLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_likes do |t|
      t.references :item, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
