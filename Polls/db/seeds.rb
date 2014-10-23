# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create!(:user_name => Faker::Internet.email)
end

3.times do
  Poll.create!(author_id: User.first.id, title: Faker::Lorem.sentence)
end

5.times do
  Poll.create!(author_id: User.find_by_id(2).id, title: Faker::Lorem.sentence)
end

4.times do 
  Question.create!(text: Faker::Lorem.sentence, poll_id: 2)
end

8.times do 
  Question.create!(text: Faker::Lorem.sentence, poll_id: 3)
end

4.times do 
  AnswerChoice.create!(text: Faker::Lorem.sentence, question_id: 1)
end

4.times do 
  AnswerChoice.create!(text: Faker::Lorem.sentence, question_id: 12)
end

5.times do |i|
  Response.create!(user_id: i + 1, answer_choice_id: rand(8) + 1)
end

