class CreativesController < ApplicationController

  def index
    if params[:skill]
      @creatives = User.creatives.tagged_with(params[:skill], :on => :skills, :any => true)
    elsif params[:industry]
      @creatives = User.creatives.tagged_with(params[:industry], :on => :industries, :any => true)
    elsif params[:client]
      @creatives = User.creatives.tagged_with(params[:client], :on => :clients, :any => true)
    else
      @creatives = User.creatives
    end
  end

  def show
    @creative = User.creative.find(params[:id])
  end

  def new
    @creative = User.creative.new
  end

  def create
    @creative = User.creative.create(creative_params)

    if @creative.save
      redirect_to @creative
    else
      render :new
    end
  end

  def edit
    @creative = User.creative.find(params[:id])
  end

  def update
    @creative = User.creative.find(params[:id])

    if @creative.update(creative_params)
      redirect_to @creative
    else
      render :edit
    end    
  end

  private 
  
  def creative_params
    params.require(:user).permit( :email, :password, :password_confirmation,
      :username, :first_name, :last_name, :title, :company,:expertise, :experience,
      :website, :location, :excited_about, :bio, :linkedin, :twitter, :instagram,
      :skill_list, :industry_list, :client_list )
  end

end
