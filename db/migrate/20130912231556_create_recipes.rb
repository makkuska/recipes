class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.text :procedure
      t.references :author, index: true
      t.integer :portion_count
      t.references :recipe_category, index: true

      t.timestamps
    end
  end
end
