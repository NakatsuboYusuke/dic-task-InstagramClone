class Favorite < ApplicationRecord

  # association
  belongs_to :user
  belongs_to :picture

end
