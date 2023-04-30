class ChangeDatatypeStatus < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :status, :integer
  end
end
