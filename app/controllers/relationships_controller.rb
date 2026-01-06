class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:followed_id])
    current_user.following << user
    redirect_back fallback_location: root_path
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.following.delete(user)
    redirect_back fallback_location: root_path
  end
end
