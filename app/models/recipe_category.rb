class RecipeCategory < ActiveRecord::Base
  validates :name, presence: true
end
