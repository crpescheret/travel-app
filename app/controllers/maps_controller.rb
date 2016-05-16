class MapsController < ApplicationController
  layout "maps"
  
  def index
    @trip = Trip.find_by(id: params[:trip_id])
    render "index.html.erb"
  end
end
