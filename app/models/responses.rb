class Responses < ActiveRecord::Base
  attr_accessible :answer_id, :question_id, :survey_id, :user_id
end
