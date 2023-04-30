class ChangeDatatypeStatus < ActiveRecord::Migration[7.0]
  def change
    if Rails.env.development?
      change_column :tasks, :status, integer
    else
      change_column :tasks, :status, 'numeric USING CAST(status AS numeric)'
    end
  end
end
