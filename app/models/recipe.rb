class Recipe < ActiveRecord::Base
  validates :name,:description,:procedure,:author,:portion_count,:recipe_category, presence: true
  validates :portion_count, numericality: true

  belongs_to :author, class_name: 'Person'
  belongs_to :recipe_category

  alias_attribute :category,:recipe_category
end
