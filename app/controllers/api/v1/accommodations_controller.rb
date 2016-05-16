class Api::V1::AccommodationsController < ApplicationController
  def index
    @accommodations = Accommodation.all
    render "index.json.jbuilder"
  end

  def show
    if Accommodation.where(trip_id: params[:id], status: "confirmed").length > 0 
      @accommodations = Accommodation.where(trip_id: params[:id], status: "confirmed")
    else
      @accommodations = Accommodation.where(trip_id: params[:id])
    end
    render "show.json.jbuilder"
  end
end