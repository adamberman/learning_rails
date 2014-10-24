# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  
  
  has_many(
    :authored_polls,
    :class_name => "Poll",
    :foreign_key => :author_id,
    :primary_key => :id
  )
  
  has_many(
    :responses,
    :class_name => "Response",
    :foreign_key => :user_id,
    :primary_key => :id 
  )
  
  def completed_polls
    polls = self
      .responses
      .select('polls.title, Count(questions.id) AS num_questions')
      .joins(:answer_choices)
      .joins(:questions)
      .joins(:polls)
      .group('polls.id')
    
          #
    # # poll, and the number of questions per poll
    # Select
    #  polls.title, Count(questions.id)
    # From
    #  polls
    #  Join questions
    #  ON polls.id = questions.poll_id
    # Group By
    #  polls.id
#
#  (Select
#  answer_choices.question_id, count(responses.id) as responses_per_q
# From
#  responses
#  Join answer_choices
#  ON responses.answer_choice_id = answer_choices.id
# WHERE
#  responses.user_id = 2 group by answer_choices.id) as q_id_and_responses
    
     #question ID, and the number of responses per question per user (which should be 0 or 1)     #
     # <<-SQL
     # SELECT
     #   polls.title, SUM(responses_per_q)
     # FROM
     #   polls
     # JOIN
     #   (SELECT
     #      questions.*, responses_per_q
     #    FROM
     #      questions
     #    JOIN (
     #      SELECT
     #        answer_choices.question_id, COUNT(responses.id) AS responses_per_q
     #      FROM
     #        responses
     #      JOIN
     #        answer_choices ON responses.answer_choice_id = answer_choices.id
     #      WHERE
     #        responses.user_id = 3
     #      GROUP BY answer_choices.id
     #     ) AS q_id_and_responses
     #     ON q_id_and_responses.question_id = questions.id
     #   ) AS q_and_responses
     #   ON polls.id = q_and_responses.poll_id
     #   GROUP BY
     #     polls.id
     # SQL
     #
     #
    
  end
end
