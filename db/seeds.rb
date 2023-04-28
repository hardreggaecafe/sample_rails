# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Task.count == 0
  5.times do |n|
    Task.create!(
      name: "タスク名#{n + 1}",
      description: "#{n + 1}度頑張る",
      status: "on schedule",
      duedate: "2023/4/30",
      label: "red"
    )
  end
end
