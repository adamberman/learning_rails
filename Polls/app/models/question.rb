# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  poll_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :text, :poll_id, presence: true
  
  belongs_to(
    :poll,
    :class_name => "Poll",
    :foreign_key => :poll_id,
    :primary_key => :id
  )
  
  has_many(
    :answer_choices,
    :class_name => "AnswerChoice",
    :foreign_key => :question_id,
    :primary_key => :id
  )
  
  has_many :responses, through: :answer_choices, source: :responses 
  
  def results
    answer_count = Hash.new(0)
    answer_choices.each do |answer_choice|
      answer_count[answer_choice.text] += answer_choice.responses.count
    end
    answer_count
  end
  
  def results2
    i = 0
    answer_count = Hash.new(0)
    answer_choices.includes(:responses).each do |answer_choice|
      answer_count[answer_choice.text] += answer_choice.responses.length
      answer_count[i] = answer_choice.responses.where('answer_choice_id < 3')
      i += 1
    end
    answer_count
  end
  
  def sql_results
    answer_choices_with_counts = self
      .answer_choices
      .select("answer_choices.text, COUNT(responses.id) AS response_count")
      .joins("left outer join responses on answer_choices.id = responses.answer_choice_id")
      .group("answer_choices.id")
      answer_count = Hash.new(0)
      answer_choices_with_counts.each do |ac_with_counts|
        answer_count[ac_with_counts.text] += ac_with_counts.response_count
      end
      answer_count
  end
end
