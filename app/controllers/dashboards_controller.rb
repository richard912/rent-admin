class DashboardsController < ApplicationController
  before_action :authenticate_agent!

  def index
    @users = User.all
    @listings = Listing.all    
  end
end
