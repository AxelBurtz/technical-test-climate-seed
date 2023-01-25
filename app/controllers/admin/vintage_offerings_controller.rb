class Admin::VintageOfferingsController < ApplicationController

  def index
    authorize :vintage_offering, :index?
    @vintage_offerings = VintageOffering.all
  end
end
