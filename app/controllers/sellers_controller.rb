class SellersController < ApplicationController
  def index
    authorize :seller, :index?

    @sellers = Seller.all
  end

  def check_name
    inputted_name = params[:name]
    seller = Seller.find_by(name: inputted_name)
    if seller.present?
      redirect_to project_offerings_path
    else
      flash[:notice] = "Not authorized, try again."
      redirect_to sellers_path
    end
  end


end
