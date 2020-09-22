class Blog < ApplicationRecord

belongs_to :user, optional: true
validates :title, presence: true
validates :text, presence: true

attachment :img

end
