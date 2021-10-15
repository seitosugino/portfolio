class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.integer "price", null: false
      t.integer "amount", null: false
      t.integer "making_status", default: 0, null: false

      t.timestamps
    end
  end
end
