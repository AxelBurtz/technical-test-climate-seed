class Admin::BuyersController < ApplicationController
    before_action :set_buyer, only: %i[edit update destroy]

  def index
    authorize :buyer, :index?
    @buyers = Buyer.all
  end

  def new
    authorize :buyer, :new?
    @buyer = Buyer.new
  end

  def edit
    authorize :buyer, :edit?
  end

  def create
    authorize :buyer, :create?
    @buyer = Buyer.new(buyer_params)
    if @buyer.save
      redirect_to admin_buyers_path, notice: 'Buyer was successfully updated'
    else
      render :new, buyer: @buyer
    end
  end

  def update
    authorize :buyer, :update?

    if @buyer.update(buyer_params)
      redirect_to admin_buyers_path, notice: 'Buyer was successfully updated'
    else
      render :new, buyer: @buyer
    end
  end

  def destroy
    authorize :buyer, :destroy?

    @buyer.destroy
    redirect_to admin_buyers_path, notice: 'Buyer was successfully destroyed.'
  end

  private

  def set_buyer
    @buyer = Buyer.find(params[:id])
  end

  def buyer_params
    params.require(:buyer).permit(:name)
  end
end
