class Micropost < ActiveRecord::Base
  attr_accessible :content, :name, :surveyURL, :tag_names
	belongs_to :user
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  validates :name, presence: true
	validates :content, presence: true
	validates :user_id, presence: true
	default_scope order: 'microposts.created_at DESC'

  attr_writer :tag_names
  after_save :assign_tags

	# Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end

  def tag_names
    @tag_names || tags.map(&:name).join(' ')
  end

  private

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end
end
