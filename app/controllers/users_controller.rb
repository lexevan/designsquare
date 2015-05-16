class UsersController < ApplicationController
  before_action :authenticate_user!

  def creatives_index
    if params[:skill]
      @creatives = User.creative.tagged_with(params[:skill], :on => :skills, :any => true)
    elsif params[:industry]
      @creatives = User.creative.tagged_with(params[:industry], :on => :industries, :any => true)
    elsif params[:client]
      @creatives = User.creative.tagged_with(params[:client], :on => :clients, :any => true)
    else
      @creatives = User.creative
    end
  end

  def show
    @user = User.friendly.find(params[:id])
 
    @posts = @user.posts
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user

    if @user.update(user_params)
      flash = { success: "Your profile has been updated.", error: "Something went wrong, please check the fields below and try again." }
      redirect_to @user
    else
      render :edit
    end
  end

  def portfolio
    @user = User.friendly.find(params[:id])
    @projects = @user.projects
  end

  def experience
    @user = User.friendly.find(params[:id])
    @experience = @user.experience
  end

  def favorites
    @user = User.friendly.find(params[:id])
    @favorites = @user.find_voted_items
  end

  def followers
    @user = User.friendly.find(params[:id])
    @followers = @user.followers
  end

  def following
    @user = User.friendly.find(params[:id])
    @following = @user.following_users
  end

  def collections
    @user = User.friendly.find(params[:id])
    @collections = @user.collections
  end

  def remove_avatar
    @user = current_user
    @user.avatar = nil
    @user.save
    redirect_to @user
  end

  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :title, :avatar, :company,:expertise, :experience,
      :website, :location, :excited_about, :bio, :linkedin, :twitter, :instagram,
      :skill_list, :industry_list, :client_list)
  end
end
