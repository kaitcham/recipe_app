require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  it 'valid if quantity is present' do
    @user = User.create!(name: 'Chris', email: 'Chris@gmail.com', password: 'Chris123')
    @food = @user.foods.create(name: 'Ugali', measurement_unit: 'grams', price: 150)
    @recipe = @user.recipes.create(name: 'Ugali', preparation_time: 30, cooking_time: 150, description: 'Add flour.',
                                   public: true)
    @recipe_food = @recipe.recipe_foods.create(food_id: @food.id)
    expect(@recipe).to_not be_valid
  end
  it 'must be associated with a recipe' do
    @user = User.create!(name: 'Chris', email: 'Chris@gmail.com', password: 'Chris123')
    @food = @user.foods.create(name: 'Ugali', measurement_unit: 'grams', price: 150)
    @recipe = @user.recipes.create(name: 'Ugali', preparation_time: 30, cooking_time: 150, description: 'Add flour.',
                                   public: true)
    @recipe_food = RecipeFood.create(quantity: 5, food_id: @food.id)
    expect(@recipe).to be_valid
  end
end
