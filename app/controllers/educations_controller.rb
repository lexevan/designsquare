class EducationsController < ApplicationController
before_action :authenticate_user!

  def new
    @education = Education.new
  end

  def create
    @education = Education.create(education_params)

    if @education.save
      redirect_to user_experience_path(@education.user)
    else
      render :new
    end
  end

  def edit
    @education = Education.find(params[:id])
  end

  def update
    @education = Education.find(params[:id])

    if @education.update(education_params)
      redirect_to @education
    else
      render :edit
    end    
  end

  private 

  def education_params
    params.require(:education).permit( :school, :degree, :location, :description, :start_year, :end_year, :user_id)
  end
end