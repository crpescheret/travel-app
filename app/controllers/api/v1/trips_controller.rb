class Api::V1::TripsController < ApplicationController
  def index
    @trips = Trip.where(user_id: current_user.id)
    render "index.json.jbuilder"
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    render "show.json.jbuilder"
  end
end
