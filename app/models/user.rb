class User < ApplicationRecord

  validates :full_name, presence: true, length: { maximum: 30 }
  validates :user_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  validates :image, presence: true
  #validates :birthday, presence: true
  #validates :gender, presence: true


  before_validation { email.downcase! }

  # get password
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # get image
  mount_uploader :image, ImageUploader

  # association
  has_many :pictures, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture

  has_many :comments, dependent: :destroy
  has_many :comment_pictures, through: :comments, source: :picture

end
