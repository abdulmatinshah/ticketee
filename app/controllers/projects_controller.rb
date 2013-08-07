class ProjectsController < ApplicationController
  before_action :set_params, only: [:show]
  def index
  end
  def new
    @project = Project.new
  end
  def show
  end
  def create

    @project = Project.new(project_params)
    @project.save
    flash[:notice] = "Project has been created."
    redirect_to @project
  end

  private #-----------------------------------------
  def set_params
    @project = Project.find(params[:id])
  end
  def project_params
    params.require(:project).permit(:name)
  end

end
