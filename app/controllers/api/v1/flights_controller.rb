class Api::V1::FlightsController < ApplicationController
  def index
    @flights = Flight.all
    render "index.json.jbuilder"
  end

  def show
    @flights = Flight.where(trip_id: params[:id])
    render "show.json.jbuilder"
  end

  def search
    @flights = Unirest.post(
      "https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyBUqpHI9A_LcOkBvxMNtQ0hmZLY9ywm-_4",
      headers: { "Accept" => "application/json", "Content-Type" => "application/json" },       
      parameters: {
        request: {
          passengers: {
            adultCount: "1"
          },
          slice: [
            {
              origin: params[:origin],
              destination: params[:destination],
              date: params[:date]
            }
          ],
          solutions: "5"
        }
      }.to_json 
    ).body
    render "search.json.jbuilder"
  end

  def create
    @flight = Flight.create(
      trip_id: params[:tripId],
      airline: params[:airline],
      flight_number: params[:flightNumber],
      depart_time: params[:departureTime],
      arrive_time: params[:arrivalTime],
      price: params[:price],
      status: "pending",
      rank: 0
    )
    if @flight.save
      redirect_to "/trips/#{@flight.trip_id}"
    else
      render json: { message: @flight.errors.full_messages }, status: 422
    end
  end
end