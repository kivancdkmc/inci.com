class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :rating, inclusion: (1..5)
  validates :user_id, uniqueness: {scope: :place_id}

end
