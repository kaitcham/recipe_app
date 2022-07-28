class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.all.where(public: true).order(id: :desc)
  end
end
