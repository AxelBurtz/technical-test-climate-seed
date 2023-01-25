class VintageOfferingsController < ApplicationController
  before_action :set_vintage_offering, only: %i[edit update destroy]


  def index
    authorize :vintage_offering, :index?
    @vintage_offerings = VintageOffering.all
  end

  def new
    authorize :vintage_offering, :new?
    @vintage_offering = VintageOffering.new
  end

  def edit
    authorize :vintage_offering, :edit?
  end

  def create
    authorize :vintage_offering, :create?

    @vintage_offering = VintageOffering.new(vintage_offering_params)

    if @vintage_offering.save
      redirect_to(vintage_offerings_path)
    else
      render :new, vintage_offering: @vintage_offering
    end
  end

  def update
    authorize :vintage_offering, :update?

    if @vintage_offering.update(vintage_offering_params)
      redirect_to(vintage_offerings_path)
    else
      render :new, vintage_offering: @vintage_offering
    end
  end

  def destroy
    authorize :vintage_offering, :destroy?

    @vintage_offering.destroy
    redirect_to vintage_offerings_path, notice: 'Vintage Offering was successfully destroyed.'
  end

  private

  def set_vintage_offering
    @vintage_offering = VintageOffering.find(params[:id])
  end

  def vintage_offering_params
    params.require(:vintage_offering).permit(:seller_id, :vintage_id, :project_id, :available_credits, :price)
  end
end
