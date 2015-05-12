class CreativesController < ApplicationController
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
    @creative = User.find(params[:id])
  end

  def edit
    @creative = User.find(params[:id])
  end

  def update
    @creative = User.find(params[:id])

    if @creative.update(creative_params)
      redirect_to @creative
    else
      render :edit
    end
  end

  private 

  def creative_params
    params.require(:user).permit(:first_name, :last_name, :title, :company,:expertise, :experience,
      :website, :location, :excited_about, :bio, :linkedin, :twitter, :instagram,
      :skill_list, :industry_list, :client_list)
  end
end
