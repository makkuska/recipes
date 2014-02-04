# encoding: UTF-8

ActiveRecord::Schema.define(version: 20130913100254) do
  create_table "ingredient_categories", force: true do |t|
    t.string "name"
  end

  create_table "ingredients", force: true do |t|
    t.string  "name"
    t.integer "ingredient_category_id"
  end

  add_index "ingredients", ["ingredient_category_id"], name: "index_ingredients_on_ingredient_category_id"

  create_table "people", force: true do |t|
    t.string "name"
  end

  create_table "recipe_ingredients", force: true do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
    t.float   "amount"
    t.integer "unit_id"
  end

  add_index "recipe_ingredients", ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
  add_index "recipe_ingredients", ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  add_index "recipe_ingredients", ["unit_id"], name: "index_recipe_ingredients_on_unit_id"

  create_table "recipe_categories", force: true do |t|
    t.string "name"
  end

  create_table "recipe_recipe_categories", force: true do |t|
    t.integer "recipe_id"
    t.integer "recipe_category_id"
  end

  add_index "recipe_recipe_categories", ["recipe_id"],
    name: "index_recipe_recipe_categories_on_recipe_id"
  add_index "recipe_recipe_categories", ["recipe_category_id"],
    name: "index_recipe_recipe_categories_on_recipe_category_id"

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "procedure"
    t.integer  "portion_count"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  # a chci tam komenty k receptům od lidí, jak na fb, Kubo! Děkuji.

  add_index "recipes", ["author_id"], name: "index_recipes_on_author_id"

  create_table "units", force: true do |t|
    t.string "name"
  end
end
