# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do
  User.create!(:user_name => Faker::Internet.email)
end

2.times do
  Poll.create!(author_id: User.first.id, title: Faker::Lorem.sentence)
end

# 5.times do
#   Poll.create!(author_id: User.find_by_id(2).id, title: Faker::Lorem.sentence)
# end

2.times do 
  Question.create!(text: Faker::Lorem.sentence, poll_id: 1)
end

2.times do 
  Question.create!(text: Faker::Lorem.sentence, poll_id: 2)
end


# 8.times do
#   Question.create!(text: Faker::Lorem.sentence, poll_id: 3)
# end

4.times do 
  AnswerChoice.create!(text: Faker::Lorem.sentence, question_id: 1)
end

4.times do 
  AnswerChoice.create!(text: Faker::Lorem.sentence, question_id: 2)
end

4.times do 
  AnswerChoice.create!(text: Faker::Lorem.sentence, question_id: 3)
end

4.times do 
  AnswerChoice.create!(text: Faker::Lorem.sentence, question_id: 4)
end

Response.create!(user_id: 2, answer_choice_id: 1)
Response.create!(user_id: 2, answer_choice_id: 5)
Response.create!(user_id: 3, answer_choice_id: 9)
Response.create!(user_id: 3, answer_choice_id: 1)

# 5.times do |i|
#   Response.create!(user_id: i + 1, answer_choice_id: rand(8) + 1)
# end

