class AddColumnRoleToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :role, :boolean, default: "false"
  end
end
