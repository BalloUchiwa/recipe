class Recipi < ApplicationRecord
  has_many :ingredients
  
  validates :title, uniqueness: true, presence: true
end
