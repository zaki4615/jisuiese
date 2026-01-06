class SearchController < ApplicationController
  def search
    @model = params[:model]
    @keyword = params[:keyword]

    if @model == "recipe"
      
      @results = Recipe.joins(:tags)
                       .left_joins(:tags)
                       .where(
                             "recipes.title LIKE :q
                              OR recipes.body LIKE :q
                              OR tags.name LIKE :q",
                             q: "%#{@keyword}%"
                        )
                       .distinct
    elsif @model == "user"
      @results = User.where("name LIKE ?", "%#{@keyword}%")
    else
      @results = []
    end
  end
end
