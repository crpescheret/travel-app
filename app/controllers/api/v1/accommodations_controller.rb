class Api::V1::AccommodationsController < ApplicationController
  def index
    @accommodations = Accommodation.all
    render "index.json.jbuilder"
  end

  def show
    @accommodations = Accommodation.where(trip_id: params[:id])
    render "show.json.jbuilder"
  end
end