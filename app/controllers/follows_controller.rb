class FollowsController < ApplicationController

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to(:back)
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to(:back)
  end

  def block
    @user = User.find(params[:id])
    current_user.block(@user)
    redirect_to(:back)
  end

  def unblock
    @user = User.find(params[:id])
    current_user.unblock(@user)
    redirect_to(:back)
  end

end
