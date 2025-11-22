class UsersController < ApplicationController
  before_action :authenticate_user!

  # /users/my_page
  def my_page
    @user = current_user
    @recipes = @user.recipes.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to my_page_path, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    reset_session
    redirect_to new_user_registration_path, notice: "退会しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

