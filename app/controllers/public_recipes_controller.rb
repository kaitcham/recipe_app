class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(:recipe_foods, :user).where('public = true').order(id: :desc)
  end
end
