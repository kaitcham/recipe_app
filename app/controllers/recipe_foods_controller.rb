class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all
  end

  def new
    @recipe_food = RecipeFood.new
    @recipes = current_user.recipes
    @foods = current_user.foods
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    if @recipe_food.save
      flash[:notice] = 'RecipeFood create successfully!'
      redirect_to recipe_foods_path
    else
      flash[:notice] = "Couldn't create a new recipefood, Please try again!"
      redirect_to new_recipe_food_path
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
