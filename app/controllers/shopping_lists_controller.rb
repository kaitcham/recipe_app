class ShoppingListsController < ApplicationController
  def index
    @shopping_list = Food.all
  end
end
