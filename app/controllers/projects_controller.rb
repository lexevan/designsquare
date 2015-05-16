class ProjectsController < ApplicationController
before_action :authenticate_user!
  
  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @user = current_user
  end

  def create
    @project = Project.create(project_params)
    @user = current_user

    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit
    @project = project.find(params[:id])
    @user = current_user
  end

  def update
    @project = project.find(params[:id])
    @user = current_user

    if @project.update(project_params)
      redirect_to @project
    else
      render :edit
    end    
  end

  private 

  def project_params
    params.require(:project).permit( :name)
  end

end
