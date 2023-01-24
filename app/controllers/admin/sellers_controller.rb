class Admin::SellersController < ApplicationController
    before_action :set_seller, only: %i[edit update destroy]

  def index
    authorize :seller, :index?
    @sellers = Seller.all
  end

  def new
    authorize :seller, :new?
    @seller = Seller.new
  end

  def edit
    authorize :seller, :edit?
  end

  def create
    authorize :seller, :create?
    @seller = Seller.new(seller_params)
    if @seller.save
      redirect_to admin_sellers_path, notice: 'Seller was successfully updated'
    else
      render :new, seller: @seller
    end
  end

  def update
    authorize :seller, :update?

    if @seller.update(seller_params)
      redirect_to admin_sellers_path, notice: 'Seller was successfully updated'
    else
      render :new, seller: @seller
    end
  end

  def destroy
    authorize :seller, :destroy?

    @seller.destroy
    redirect_to admin_sellers_path, notice: 'Seller was successfully destroyed.'
  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def seller_params
    params.require(:seller).permit(:name)
  end
end
