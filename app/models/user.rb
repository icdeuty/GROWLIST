class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true
  validates :profile, presence: true
  attachment :profile_img

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_many :tweet_comment, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :shop_comments, dependent: :destroy
  has_many :shops, dependent: :destroy
  has_many :shop_favs, dependent: :destroy
  has_many :blog_favs, dependent: :destroy
  has_many :tweet_favs, dependent: :destroy

  def follow(other_user)
  	unless self == other_user
  		self.relationships.find_or_create_by(follow_id: other_user.id)
  	end
  end

  def unfollow(other_user)
  	relationship = self.relationships.find_by(follow_id: other_user.id)
  	relationship.destroy if relationship
  end

  def following?(other_user)
  	self.followings.include?(other_user)
  end

end
