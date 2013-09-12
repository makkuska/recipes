class CreateRecipeCategories < ActiveRecord::Migration
  def change
    create_table :recipe_categories do |t|
      t.string :name
    end
  end
end
