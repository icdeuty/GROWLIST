class Blog < ApplicationRecord

belongs_to :user
validates :title, presence: true
validates :text, presence: true

attachment :img
has_many :blog_favs, dependent: :destroy

def favorited_by?(user)
	blog_favs.where(user_id: user.id).exists?
end

end
