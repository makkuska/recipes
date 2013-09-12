Recipes::Application.routes.draw do
  resources :recipes

  resources :ingredients
  resources :recipe_categories
  resources :units
  resources :people
  resources :ingredient_categories

  root 'ingredient_categories#index'
end
