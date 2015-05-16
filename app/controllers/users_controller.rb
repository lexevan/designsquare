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

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :title, :company,:expertise, :experience,
      :website, :location, :excited_about, :bio, :linkedin, :twitter, :instagram,
      :skill_list, :industry_list, :client_list)
  end
end
