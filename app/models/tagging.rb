class Tagging < ActiveRecord::Base
  belongs_to :fable
  belongs_to :tag

  attr_accessible :fable_id, :tag_id
end
