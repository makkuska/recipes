class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, index: true
      t.references :ingredient, index: true
      t.float :amount
      t.references :unit, index: true
    end
  end
end
