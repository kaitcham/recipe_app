require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'valid if name is present' do
    @user = User.create!(name: 'Chris', email: 'Chrismlg90@gmail.com', password: 'Chris123')
    @recipe = @user.recipes.create(name: 'Chapati', description: 'tasty', preparation_time: 'ten', cooking_time: 'four')
    expect(@recipe).to be_valid
  end
  it 'invalid if name is absent' do
    @user = User.create!(name: 'Chris', email: 'Chrismlg90@gmail.com', password: 'Chris123')
    @recipe = @user.recipes.create(name: 'Chapati', description: 'tasty', preparation_time: 'ten', cooking_time: 'four')
    expect(@recipe).to be_valid
  end
  it 'Recipe must be associated with a user' do
    @recipe = Recipe.create(name: 'Chapati', description: 'tasty', preparation_time: 'ten', cooking_time: 'thirty')
    expect(@recipe).to_not be_valid
  end
  it 'valid if User is present' do
    @user = User.create!(name: 'Chris', email: 'Chrismlg90@gmail.com', password: 'Chris123')
    @recipe = @user.recipes.create(name: 'Chapati', description: 'tasty', preparation_time: 'ten', cooking_time: 'five')
    expect(@recipe).to be_valid
  end
  it 'valid if name is present' do
    @user = User.create!(name: 'Chris', email: 'Chrismlg90@gmail.com', password: 'Chris123')
    @recipe = @user.recipes.create(name: 'Chapati', description: 'tasty', preparation_time: 'ten', cooking_time: 'one')
    expect(@recipe).to be_valid
  end
  it 'Recipe must have a description' do
    @user = User.create!(name: 'Chris', email: 'Chrismlg90@gmail.com', password: 'Chris123')
    @recipe = @user.recipes.create(name: 'Chapati', preparation_time: '10 minutes', cooking_time: '30 minutes')
    expect(@recipe).to_not be_valid
  end
  it 'Recipe must have a preparation time' do
    @user = User.create!(name: 'Chris', email: 'Chrismlg90@gmail.com', password: 'Chris123')
    @recipe = @user.recipes.create(name: 'Chapati', description: 'Chapati', cooking_time: '30 mins')
    expect(@recipe).to_not be_valid
  end
  it 'Recipe must have a cooking time' do
    @user = User.create!(name: 'Chris', email: 'Chrismlg90@gmail.com', password: 'Chris123')
    @recipe = @user.recipes.create(name: 'Chapati', description: 'Chapati', preparation_time: '10 mins')
    expect(@recipe).to_not be_valid
  end
end