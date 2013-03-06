class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :fables, :through => :taggings

  attr_accessible :name

end
