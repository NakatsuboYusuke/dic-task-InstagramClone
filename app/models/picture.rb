class Picture < ApplicationRecord

  validates :content, presence: true

  # association
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  # image_up_lodaer
  mount_uploader :image, ImageUploader

end
