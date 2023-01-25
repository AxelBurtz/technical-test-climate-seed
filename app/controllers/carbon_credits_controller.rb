class CarbonCreditsController < ApplicationController
  def index
    @project_offerings = ProjectOffering.where(status: 'validated')
  end

end
