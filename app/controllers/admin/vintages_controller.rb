class Admin::VintagesController < ApplicationController
  before_action :set_vintage, only: %i[show edit update destroy]

  def index
    authorize :vintage, :index?
    @vintages = Vintage.all
  end

  def new
    authorize :vintage, :new?
    @vintage = Vintage.new
  end

  def edit
    authorize :vintage, :edit?
  end

  def create
    authorize :vintage, :create?
    @vintage = Vintage.new(vintage_params)
    if @vintage.save
      redirect_to admin_vintages_path, notice: 'Vintage was successfully updated'
    else
      render :new, vintage: @vintage
    end
  end

  def update
    authorize :vintage, :update?

    if @vintage.update(vintage_params)
      redirect_to admin_vintages_path, notice: 'Vintage was successfully updated'
    else
      render :new, vintage: @vintage
    end
  end

  def destroy
    authorize :vintage, :destroy?

    @vintage.destroy
    redirect_to admin_vintages_path, notice: 'Vintage was successfully destroyed.'
  end

  private

  def set_vintage
    @vintage = Vintage.find(params[:id])
  end

  def vintage_params
    params.require(:vintage).permit(:project_id, :name)
  end
end
