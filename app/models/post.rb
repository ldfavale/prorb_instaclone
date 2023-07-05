class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable

  

  def is_liked_by(user)
     !!user.likes.find_by(likeable_id: self.id, likeable_type: self.class.to_s)
  end
end
