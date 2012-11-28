class Response < ActiveRecord::Base
  attr_accessible :user_id, :answer_id, :question_id, :survey_id
  belongs_to :survey

  validates :user_id, presence: true
  validates :survey_id, presence: true
  validates :question_id, presence: true
  validates :answer_id, presence: true
end