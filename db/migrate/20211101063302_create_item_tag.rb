class CreateItemTag < ActiveRecord::Migration[5.2]
  def change
    create_table :item_tags do |t|
      t.string :name
      t.integer :item_id
      
      t.timestamps
    end
  end
end
