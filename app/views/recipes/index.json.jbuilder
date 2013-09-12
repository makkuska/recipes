json.array!(@recipes) do |recipe|
  json.extract! recipe, :name, :description, :procedure, :author_id, :portion_count, :recipe_category_id
  json.url recipe_url(recipe, format: :json)
end
