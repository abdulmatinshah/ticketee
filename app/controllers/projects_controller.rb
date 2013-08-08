class ProjectsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
  end
  def create
  @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
    flash[:alert] = "Project has not been created."
    render :action => "new"
    end
  end
  def show
    @tickets = @project.tickets
  end
  def edit
  end
  def update

    respond_to do |format|
      if @project.update(project_params)
        format.html {redirect_to @project,  notice: 'project saved succefully' }
      else
        format.html { render :edit, alert: 'Project could not be saved!'}
      end

    end
  end
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "#{@project.name} destroyed successfully,"}
    end
  end



  private #-----------------------------------------
  def set_params
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Record was not found'
  end
  def project_params
    params.require(:project).permit(:name)
  end

end
