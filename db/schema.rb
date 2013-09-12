# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130912231556) do

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

  create_table "recipe_categories", force: true do |t|
    t.string "name"
  end

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "procedure"
    t.integer  "author_id"
    t.integer  "portion_count"
    t.integer  "recipe_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipes", ["author_id"], name: "index_recipes_on_author_id"
  add_index "recipes", ["recipe_category_id"], name: "index_recipes_on_recipe_category_id"

  create_table "units", force: true do |t|
    t.string "name"
  end

end
