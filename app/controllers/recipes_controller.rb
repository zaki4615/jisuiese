class RecipesController < ApplicationController
    def new
      @recipe = Recipe.new
    end

    def create
     @recipe = Recipe.new(recipe_params)
     @recipe.user_id = current_user.id
     @recipe.save
     redirect_to recipes_path
    end



   
private

  def recipe_params
    params.require(:recipe).permit(:title, :body, )
  end

end
