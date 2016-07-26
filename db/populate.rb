require "./config/dependencies"

List.create!(name: "Homework")
List.create!(name: "House")

Task.create!(name: "Finish Wuthergrund", list_id: 1, complete: true)
Task.create!(name: "Finish Choose Your Adventure", list_id: 1, complete: false)
Task.create!(name: "Code game block for Choose Your Adventure", list_id: 1, complete: false)
Task.create!(name: "Pack living room", list_id: 2, complete: false)
Task.create!(name: "Pack bedrooms", list_id: 2, complete: false )
Task.create!(name: "Open House", list_id: 2, complete: false)
