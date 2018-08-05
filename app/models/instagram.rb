class Instagram < ApplicationRecord
  validates :content, length: { maximum: 145 } # 145文字以下
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  mount_uploader :image, ImageUploader
end
