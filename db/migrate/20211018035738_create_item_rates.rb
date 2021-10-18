class CreateItemRates < ActiveRecord::Migration[5.2]
  def change
    create_table :item_rates do |t|
      t.references :item, foreign_key: true
      t.references :customer, foreign_key: true
      t.float :star
      t.string :comment

      t.timestamps
    end
  end
end
