require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(birth_date: Date.new(2009,5,17), color: "black", name: Faker::Name.first_name, sex: "M")
Cat.create!(birth_date: Date.new(2008,3,2), color: "brown", name: Faker::Name.last_name, 
            sex: "M", description: "That one great time we had")
Cat.create!(birth_date: Date.new(2011,4,17), color: "calico", name: Faker::Name.name, sex: "M")
Cat.create!(birth_date: Date.new(2013,12,17), color: "orange", name: Faker::Name.name, sex: "F")
Cat.create!(birth_date: Date.new(2009,5,17), color: "black", name: Faker::Name.first_name, sex: "M")
Cat.create!(birth_date: Date.new(2008,3,2), color: "brown", name: Faker::Name.name, 
            sex: "M", description: "That one great time we had")
Cat.create!(birth_date: Date.new(2011,4,17), color: "calico", name: Faker::Name.name, sex: "M")
Cat.create!(birth_date: Date.new(2013,12,17), color: "orange", name: Faker::Name.name, sex: "F")