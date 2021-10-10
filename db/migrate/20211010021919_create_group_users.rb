class CreateGroupUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_users do |t|
      t.references :group, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
