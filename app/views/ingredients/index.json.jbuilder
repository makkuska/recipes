json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :name, :ingredient_category_id
  json.url ingredient_url(ingredient, format: :json)
end
