class ChangeDatatypeStatus < ActiveRecord::Migration[7.0]
  def change
    if Rails.env.development?
      change_column :tasks, :status, :integer
    else
      remove_column :tasks, :status
      add_column :tasks, :status, :integer, after: :description
    end
  end
end
