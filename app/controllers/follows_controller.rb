class FollowsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @user = User.find(params[:follow][:followed_id])
    current_user.follow(@user) unless current_user.id == @user.id
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Follow.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
