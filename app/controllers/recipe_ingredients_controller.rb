class RecipeIngredientsController < ApplicationController
  before_action :set_recipe_ingredient, only: [:update, :destroy]

  # POST /recipe_ingredients
  # POST /recipe_ingredients.json
  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)

    respond_to do |format|
      if @recipe_ingredient.save
        format.html { redirect_to @recipe_ingredient,
          notice: 'Recipe ingredient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe_ingredient }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_ingredients/1
  # PATCH/PUT /recipe_ingredients/1.json
  def update
    respond_to do |format|
      if @recipe_ingredient.update(recipe_ingredient_params)
        format.html { redirect_to @recipe_ingredient,
          notice: 'Recipe ingredient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_ingredients/1
  # DELETE /recipe_ingredients/1.json
  def destroy
    @recipe_ingredient.destroy
    respond_to do |format|
      format.html { redirect_to @recipe_ingredient.recipe }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_ingredient
      @recipe_ingredient = RecipeIngredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_ingredient_params
      params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :amount, :unit_id)
    end
end
