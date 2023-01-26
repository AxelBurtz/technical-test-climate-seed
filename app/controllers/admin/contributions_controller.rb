class Admin::ContributionsController < ApplicationController
  def index
    authorize :contribution, :index?
    @contributions = Contribution.all
  end

  def update
    authorize :contribution, :update?

    if @contribution.update(contribution_params)
      redirect_to(admin_contributions_path)
    else
      render :new, contribution: @contribution
    end
  end

  def update_status
    @contribution = Contribution.find(params[:id])
    @contribution.update(status: params[:contribution][:status])
    redirect_to admin_contributions_path
  end

  private

  def contribution_params
    params.require(:contribution).permit(:status)
  end
end
