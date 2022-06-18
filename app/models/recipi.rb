class Recipi < ApplicationRecord
  validates :title, uniqueness: true, presence: true
end
