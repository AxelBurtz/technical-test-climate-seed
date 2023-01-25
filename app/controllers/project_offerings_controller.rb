class ProjectOfferingsController < ApplicationController
  before_action :set_project_offering, only: %i[edit update destroy update_status]


  def index
    authorize :project_offering, :index?
    @project_offerings = ProjectOffering.all
  end

  def new
    authorize :project_offering, :new?
    @project_offering = ProjectOffering.new
  end

  def edit
    authorize :project_offering, :edit?
  end

  def create
    authorize :project_offering, :create?

    @project_offering = ProjectOffering.new(project_offering_params)

    if @project_offering.save
      redirect_to(project_offerings_path)
    else
      render :new, project_offering: @project_offering
    end
  end

  def update
    authorize :project_offering, :update?

    if @project_offering.update(project_offering_params)
      redirect_to(admin_project_offerings_path)
    else
      render :new, project_offering: @project_offering
    end
  end

  def destroy
    authorize :project_offering, :destroy?

    @project_offering.destroy
    redirect_to project_offerings_path, notice: 'Project Offering was successfully destroyed.'
  end

  def update_status
    @project_offering.update(status: params[:project_offering][:status])
    redirect_to admin_projects_path
  end

  private

  def set_project_offering
    @project_offering = ProjectOffering.find(params[:id])
  end

  def project_offering_params
    params.require(:project_offering).permit(:project_id, :seller_id, :project_description, :status)
  end

  def status_params
    params.require(:projec_offering).permit(:status)
  end
end
