class Link < ActiveRecord::Base
  attr_accessible :description, :url
  belongs_to :linkable, :polymorphic => true

  validates :url, presence: true
  validates :linkable_id, presence: true
end
