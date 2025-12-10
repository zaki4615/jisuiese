class SearchController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @keyword = params[:keyword]

    if @model == "user"
      @results = User.where("name LIKE ?", "%#{@keyword}%")
    elsif @model == "recipe"
      @results = Recipe.where("title LIKE ? OR body LIKE ?", "%#{@keyword}%", "%#{@keyword}%")
    else
      @results = []
    end
  end
end
