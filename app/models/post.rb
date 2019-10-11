class Post < ApplicationRecord
  
  belongs_to :user
  
  has_many :favorites, foreign_key: "post_id", dependent: :destroy
  has_many :users, through: :favorites
  
  mount_uploader :image, ImageUploader
  
  validates :title, presence: true, length: { maximum: 25 }
  validates :ingredient, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
  
  def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['title LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end  
end