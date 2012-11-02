class Micropost < ActiveRecord::Base
  attr_accessible :content, :name
	belongs_to :user
  has_one :survey, dependent: :destroy

  validates :name, presence: true
	validates :content, presence: true
	validates :user_id, presence: true
	default_scope order: 'microposts.created_at DESC'

	# Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
end
