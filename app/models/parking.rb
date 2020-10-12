class Parking < ApplicationRecord
  belongs_to :user
  attachment :image
end
