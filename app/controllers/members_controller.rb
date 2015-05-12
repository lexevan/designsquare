class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    @member = User.find(params[:id])
  end

  def edit
    @member = User.find(params[:id])
  end

  def update
    @member = User.find(params[:id])

    if @member.update(member_params)
      redirect_to @member
    else
      render :edit
    end    
  end

  private 

  def member_params
    params.require(:user).permit(:first_name, :last_name, :title, :company,:expertise, :experience,
      :website, :location, :excited_about, :bio, :linkedin, :twitter, :instagram)
  end
end
