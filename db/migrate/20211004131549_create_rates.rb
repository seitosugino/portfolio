class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :post, foreign_key: true
      t.references :customer, foreign_key: true
      t.float :star

      t.timestamps
    end
  end
end
