class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :status
      t.date :duedate
      t.string :label

      t.timestamps
    end
  end
end
