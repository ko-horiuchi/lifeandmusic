class Music < ApplicationRecord
  enum scene: { Mornig: 0, Night: 1, Holiday: 2, Drive: 3, Happy: 4, Sad: 5 }
  belongs_to :artist, optional: true
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

def liked_by?(user)
	 likes.where(user_id: user.id).exists?
end

end
