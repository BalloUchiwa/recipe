class Recipi < ApplicationRecord
  has_many :ingredients, dependent: :destroy

  validates :title, uniqueness: true, presence: true

  def create_ingredients(ingredients)
    ingredients.split.each do |name|
      Ingredient.create(name: name, recipi_id: id)
    end
  end
end
