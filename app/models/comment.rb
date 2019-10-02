class Comment < ApplicationRecord

  validates :content, presence: true, length: { maximum: 140 }

  # association
  belongs_to :user
  belongs_to :picture

end
