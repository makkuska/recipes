# == Schema Information
#
# Table name: ingredients
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  ingredient_category_id :integer
#

class Ingredient < ActiveRecord::Base
  belongs_to :ingredient_category

  alias_attribute :category, :ingredient_category

  def self.all_names
    all.map {|cat| cat.name}
  end
end
