class Ingredient < ApplicationRecord
  belongs_to :recipi

  before_save :downcase_name

  def downcase_name
    self.name = name.downcase
  end
end
