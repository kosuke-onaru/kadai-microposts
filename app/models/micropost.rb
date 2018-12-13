class Micropost < ApplicationRecord
  belongs_to :user
  
  has_many :favorites
  has_many :liked, through: :favorites, source: :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  def good(user)
    Favorite.create(micropost_id:id, user_id:user.id)
  end
  
  def ungood(user)
   # Favorite.destroy(micropost_id:id, user_id:user.id)
    Favorite.find_by(micropost_id:id,user_id:user.id).destroy
  end
  
  def gooding(user)
     self.liked.include?(user)
     #good_users.include?(user)
  end
  
  
end
