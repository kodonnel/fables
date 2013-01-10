class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :microposts, :through => :taggings

  attr_accessible :name

end
