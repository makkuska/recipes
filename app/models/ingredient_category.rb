class IngredientCategory < ActiveRecord::Base
  validates :name, presence: true
end
