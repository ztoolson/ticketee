class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :destroy, :show, :update]

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Project was successfully created"
    else
      flash[:alert] = "Project has not been created"
      render "new"
    end
  end

  def edit
  end

  def destroy
    @project.destroy
    
    flash[:notice] = "Project has been destroyed"
    redirect_to projects_path
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
  end

  def update
    if @project.update(project_params) 
      redirect_to @project, notice: "Project has been updated"
    else
      flash[:alert] = "Project has not been updated"
      render "edit"
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project you were looking for could not be found"
      redirect_to projects_path
    end

    def project_params
      params.require(:project).permit(:name, :descriptions)
    end
end
