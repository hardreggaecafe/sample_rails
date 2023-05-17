class AddRoleUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer, default: 1, after: :email
  end
end
