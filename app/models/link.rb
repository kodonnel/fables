class Link < ActiveRecord::Base
  attr_accessible :description, :url
  belongs_to :linkable, :polymorphic => true

  validates :url, presence: true
  validates :linkable_id, presence: true

  def get_user
    if linkable_type == "User"  
      @user = linkable
    else
      @user = linkable.user
    end
  end
end
