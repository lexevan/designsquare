class PositionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @position = Position.new
  end

  def create
    @position = Position.create(position_params)

    if @position.save
      redirect_to user_experience_path(@position.user)
    else
      render :new
    end
  end

  def edit
    @position = Position.find(params[:id])
  end

  def update
    @position = Position.find(params[:id])

    if @position.update(position_params)
      redirect_to @position
    else
      render :edit
    end    
  end

  private 

  def position_params
    params.require(:position).permit( :company_name, :title, :location, :description, :start_date, :end_date, :user_id)
  end

end