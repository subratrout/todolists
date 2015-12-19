# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

today = Date.today
next_due = today+1.year

User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

users = User.create! [
  {username: "Fiorina", password_digest:"xyx123"},
  {username: "Trump", password_digest:"xyx124"},
  {username: "Carson", password_digest:"xyx125"},
  {username: "Clinton", password_digest:"xyx126"},
]



profiles = Profile.create! [
      { first_name:"Carly" , last_name: "Fiorina", gender: "female",birth_year: 1954, user_id: 1},
      { first_name:"Donald" , last_name: "Trump", gender: "male",birth_year:1946, user_id: 2 },
      { first_name: "Ben" , last_name:"Carson" , gender: "male" ,birth_year: 1951, user_id: 3 },
      { first_name: "Hillary", last_name: "Clinton", gender:"female" ,birth_year: 1947, user_id: 4}
]



User.find_by!(username: "Fiorina").todo_lists.create!(list_name: "Something1", list_due_date: next_due )
User.find_by!(username: "Trump").todo_lists.create!(list_name: "Something2", list_due_date: next_due )
User.find_by!(username: "Carson").todo_lists.create!(list_name: "Something3", list_due_date: next_due )
User.find_by!(username: "Clinton").todo_lists.create!(list_name: "Something4", list_due_date: next_due )


TodoList.all.each do |list|
  list.todo_items.create! [
    { title: "Task 1", due_date: next_due, description: "very important task TEST1", completed: false },
    { title: "Task 2", due_date: next_due, description: "do something else TEST2", completed: true},
    { title: "Task 3", due_date: next_due, description: "learn Action Pack TEST3", completed: true},
    { title: "Task 4", due_date: next_due, description: "do something else TEST4", completed: true},
    { title: "Task 4", due_date: next_due, description: "learn Action Pack TEST5", completed: true}
  ]
end
