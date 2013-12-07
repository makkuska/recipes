class Ingredient < ActiveRecord::Base
  belongs_to :ingredient_category

  alias_attribute :category, :ingredient_category

  def self.all_names
    all.map {|cat| cat.name}
  end
end
