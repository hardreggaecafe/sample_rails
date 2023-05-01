# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Task.count <= 10
  100000.times do |n|
    Task.create!(
      name: "タスク名#{n + 10}",
      description: "#{n + 10}度頑張る",
      status: rand(0..5),
      duedate: "2023/#{rand(5..12)}/#{rand(1..25)}",
      label: ["red", "blue", "green"][rand(0..2)]
    )
  end
end
