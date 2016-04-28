class Api::V1::TripsController < ApplicationController
  def index
    @trips = Trip.all
    render "index.json.jbuilder"
  end
end
