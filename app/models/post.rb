class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  

  def is_liked_by(user)
     !!user.likes.find_by(post_id: self.id)
  end
end
