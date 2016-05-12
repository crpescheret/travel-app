class Api::V1::TripsController < ApplicationController
  def index
    @trips = Trip.all
    render "index.json.jbuilder"
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    render "show.json.jbuilder"
  end
end
