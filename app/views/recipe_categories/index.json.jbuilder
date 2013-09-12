json.array!(@recipe_categories) do |recipe_category|
  json.extract! recipe_category, :name
  json.url recipe_category_url(recipe_category, format: :json)
end
