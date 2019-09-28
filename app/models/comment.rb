class Comment < ApplicationRecord

  validates :content, presence: true

  # association
  belongs_to :user
  belongs_to :picture

end
