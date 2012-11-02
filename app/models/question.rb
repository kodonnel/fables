class Question < ActiveRecord::Base
  attr_accessible :content, :survey_id
  belongs_to :survey
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
