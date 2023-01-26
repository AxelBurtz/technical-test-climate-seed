class ContributionsController < ApplicationController
  def new
    @contribution = Contribution.new
  end

  def create
    @contribution = Contribution.new(contribution_params)
    if @contribution.enough_credits_available?
      if @contribution.save
        redirect_to carbon_credits_path, notice: 'Contribution submitted successfully'
      else
        render :new
      end
    else
      redirect_to new_contribution_path, notice: 'Not enough available credits'
    end
  end

  private

  def contribution_params
    params.require(:contribution).permit(:buyer_id, :seller_id, :vintage_id, :credits_quantity, :price, :status)
  end
end
