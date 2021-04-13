class Music < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  def liked_by?(user)
	   likes.where(user_id: user.id).exists?
  end

  mount_uploader :video, VideoUploader

  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    when 'likes'
      return includes(:liked_users).sort{|a,b| b.liked_users.size <=> a.liked_users.size}
    when 'dislikes'
      return includes(:liked_users).sort{|a,b| a.liked_users.size <=> b.liked_users.size}
    end
  end
end
