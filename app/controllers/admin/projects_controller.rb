class Admin::ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    authorize :project, :index?
    @projects = Project.all
  end

  def show
    authorize :project, :show?
  end

  def new
    authorize :project, :new?
    @project = Project.new
  end

  def edit
    authorize :project, :edit?
  end

  def create
    authorize :project, :create?
    @project = Project.new(project_params)

    if @project.save
      redirect_to(admin_projects_path)
    else
      render :new, project: @project
    end
  end

  def update
    authorize :project, :update?

    if @project.update(project_params)
      redirect_to(admin_projects_path)
    else
      render :new, project: @project
    end
  end

  def destroy
    authorize :project, :destroy?
    @project.destroy
    redirect_to admin_projects_path, notice: 'Project was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :registry_name, :country, :typology, :is_validated)
  end
end
