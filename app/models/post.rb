class Post < ApplicationRecord
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  validates :title, presence: true, length: { maximum: 30 }
  validates :ingredient, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
  

end