class CreativesController < ApplicationController
  before_action :authenticate_user!

  def index
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
    @creative = User.creative.find(params[:id])

    @posts = @creative.posts
  end

  def edit
    @creative = current_user
  end

  def update
    @creative = current_user

    if @creative.update(creative_params)
      flash = { success: "Your profile has been updated.", error: "Something went wrong, please check the fields below and try again." }
      redirect_to @creative
    else
      render :edit
    end
  end

  def remove_avatar
    @creative.avatar = nil
    @creative.save
    redirect_to @creative
  end

  private 

  def creative_params
    params.require(:user).permit(:first_name, :last_name, :title, :avatar, :company,:expertise, :experience,
      :website, :location, :excited_about, :bio, :linkedin, :twitter, :instagram,
      :skill_list, :industry_list, :client_list)
  end
end
