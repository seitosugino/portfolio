class AddImpressionsCountToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :impressions_count, :integer, default: 0
  end
end
