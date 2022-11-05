class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :role, "read"
  end
end
