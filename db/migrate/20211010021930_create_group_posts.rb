class CreateGroupPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :group_posts do |t|
      t.references :group, foreign_key: true
      t.references :customer, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
