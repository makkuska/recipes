Recipes::Application.routes.draw do
  resources :recipe_ingredients, only: [:create,:update,:destroy]

  resources :recipes do
    member do
      get 'add_ingredient', to: 'recipes#add_ingredient'
      get 'edit_ingredient/:ingredient_id', to: 'recipes#edit_ingredient'
    end
  end

  resources :ingredients
  resources :recipe_categories
  resources :units
  resources :people
  resources :ingredient_categories

  root 'ingredient_categories#index'
end
