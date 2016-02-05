class DashboardController < ApplicationController
  def index
    @players = User.all
  end
end
