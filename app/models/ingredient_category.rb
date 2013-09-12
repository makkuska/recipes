class IngredientCategory < ActiveRecord::Base
  validates :name, presence: true
  has_many :ingredients

  def self.all_names
    all.map {|cat| cat.name}
  end
end
