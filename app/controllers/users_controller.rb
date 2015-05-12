class UsersController < ApplicationController
  before_action :authenticate_user!


  def show
    @user = User.find(params[:id])
    if @user.creative?
      redirect_to creative_path(@user)
    elsif @user.member?
      redirect_to member_path(@user)
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.creative?
      redirect_to edit_creative_path(@user)
    elsif @user.member?
      redirect_to edit_member_path(@user)
    end
  end

end
