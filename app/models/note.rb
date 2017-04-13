class Note < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :user, optional: true
  has_many :liking_users, through: :likes, source: :user
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  mount_uploader :image, ImageUploader
end
