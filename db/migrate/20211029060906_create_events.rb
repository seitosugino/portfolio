class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :customer, foreign_key: true
      t.string :title
      t.text :content
      t.datetime :start_time

      t.timestamps
    end
  end
end
