class ProjectsController < ApplicationController
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
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params) 
      redirect_to @project, notice: "Project has been updated"
    else
      flash[:alert] = "Project has not been updated"
      render "edit"
    end
  end

  private

    def project_params
      params.require(:project).permit(:name, :descriptions)
    end
end
