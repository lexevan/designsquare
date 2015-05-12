class MembersController < ApplicationController


  def index

  end

  def show
    @member = User.member.find(params[:id])
  end

  def new
    @member = User.member.new
  end

  def create
    @member = User.member.create(member_params)

    if @member.save
      redirect_to @member
    else
      render :new
    end
  end

  def edit
    @member = User.member.find(params[:id])
  end

  def update
    @member = User.member.find(params[:id])

    if @member.update(member_params)
      redirect_to @member
    else
      render :edit
    end    
  end

  private 
  
  def member_params
    params.require(:user).permit(:expertise, :skill_list, :industry_list, :client_list, 
      user_attributes: [:experience, :username, :first_name, :last_name, :title, :company, :website,
      :location, :excited_about, :bio, :linkedin, :twitter, :instagram])
  end



end
