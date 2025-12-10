class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to recipe_path(@recipe)
    else
      # 投稿詳細に戻る（エラー時も）
      redirect_to recipe_path(@recipe), alert: "コメントを入力してください"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
      redirect_back fallback_location: root_path, notice: "コメントを削除しました"
    else
      redirect_back fallback_location: root_path, alert: "削除権限がありません"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end