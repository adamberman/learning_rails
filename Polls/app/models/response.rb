# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  answer_choice_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Response < ActiveRecord::Base
  validates :user_id, :answer_choice_id, presence: true
  validate :respondent_has_not_already_answered_question
  validate :author_must_not_respond_to_own_poll
  
  belongs_to(
    :respondent,
    :class_name => "User",
    :foreign_key => :user_id,
    :primary_key => :id 
  )
  
  belongs_to(
    :answer_choice,
    :class_name => "AnswerChoice",
    :foreign_key => :answer_choice_id,
    :primary_key => :id
  )
  
  has_one :question, through: :answer_choice, source: :question 
  
  def sibling_responses
    question.responses.where(':id IS NULL OR responses.id != :id', id: self.id)
  end
  
  private
  def respondent_has_not_already_answered_question
    sibling_responses.to_a.each do |sibling|
      if sibling.user_id == user_id
        errors[:sibling_response] << "User cannot respond to same question twice"
        break
      end
    end
  end
  
  def author_must_not_respond_to_own_poll
    if user_id == answer_choice.question.poll.author_id
      errors[:user] << "Author can't respond to own question"
    end
  end
end
