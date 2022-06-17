class Recipi < ApplicationRecord
  validates :title, uniqueness: true
end
