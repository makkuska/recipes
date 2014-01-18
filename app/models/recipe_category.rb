# == Schema Information
#
# Table name: recipe_categories
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class RecipeCategory < ActiveRecord::Base
  validates :name, presence: true

  def self.all_names
    all.map {|cat| cat.name}
  end
end
