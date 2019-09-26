class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :title, :string
    add_column :users, :mail, :string
    add_column :users, :employee_number, :string
  end
end
