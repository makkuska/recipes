class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show,:edit,:update,:destroy,
                                    :add_ingredient,:edit_ingredient]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  #############################################################################

  # POST /recipes.json
  def create
    @recipe = Recipe.new
    set_recipe_attrs

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe,
                      notice: 'Recipe was successfully created.' }
        format.json { render action: 'show',
                      status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    set_recipe_attrs

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe,
                      notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  #############################################################################

  # GET /recipes/1/add_ingredient
  def add_ingredient
    @recipe_ingredient = RecipeIngredient.new
  end

  # GET /recipes/1/edit_ingredient
  def edit_ingredient
#    @recipe_ingredient = RecipeIngredient.find_by(recipe: @recipe,ingredient: )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def set_recipe_attrs
      @recipe.attributes = recipe_params
      @recipe.author = Person.find_by(name: params[:recipe][:author])
      @recipe.category = RecipeCategory.find_by(name: params[:recipe][:category])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :procedure, :portion_count)
    end
end
