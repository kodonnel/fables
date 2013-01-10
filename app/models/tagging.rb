class Tagging < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :tag

  attr_accessible :micropost_id, :tag_id
end
