class Survey < ActiveRecord::Base
  attr_accessible :name, :micropost
  has_many :responses, :dependent => :destroy
  has_many :questions, :dependent => :destroy
  belongs_to :micropost

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  attr_accessible :questions_attributes

	validates :name, presence: true
  validates :micropost_id, presence: true
end
