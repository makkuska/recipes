class Ingredient < ActiveRecord::Base
  belongs_to :ingredient_category

  alias_attribute :category, :ingredient_category
end
