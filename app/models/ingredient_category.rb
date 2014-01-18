# == Schema Information
#
# Table name: ingredient_categories
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class IngredientCategory < ActiveRecord::Base
  validates :name, presence: true
  has_many :ingredients

  def self.all_names
    all.map {|cat| cat.name}
  end
end
