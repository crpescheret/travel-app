class Api::V1::FlightsController < ApplicationController
  def index
    @flights = Flight.all
    render "index.json.jbuilder"
  end
end