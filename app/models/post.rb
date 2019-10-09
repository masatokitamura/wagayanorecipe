class Post < ApplicationRecord
  
  belongs_to :user
  
  has_many :favorites, foreign_key: "post_id", dependent: :destroy
  has_many :users, through: :favorites
  
  mount_uploader :image, ImageUploader
  
  validates :title, presence: true, length: { maximum: 25 }
  validates :ingredient, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
end