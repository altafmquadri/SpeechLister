# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
List.destroy_all

u1 = User.create({username: "Altaf"})
u2 = User.create( {username: "Turcan"})
l1 = List.create({title: "Altaf's Grocery", category: 'grocery'})
l2 = List.create( {title: "Turcan's Todo", category: 'todo'})


Task.create(due_date: Date.new(2019, 11, 11), content: "whole wheat bread", user: u1, list: l1 )
Task.create(due_date: Date.new(2019, 11, 13), content: "fruit loops", user: u1, list: l1 )
Task.create(due_date: Date.new(2019, 11, 15), content: "green-tea", user: u2, list: l2 )
Task.create(due_date: Date.new(2019, 11, 17), content: "pet a dog", user: u2, list: l2 )
