class FlightsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @trip = Trip.find_by(id: params[:trip_id].to_i)
    render 'index.html.erb'
  end

  def create
    @flight = Flight.create(
      airline: params[:airline],
      flight_number: params[:flight_number],
      date: params[:date],
      depart_time: params[:depart_time],
      arrive_time: params[:arrive_time],
      flight_direction: params[:flight_direction],
      status: "pending",
      trip_id: params[:trip_id],
      rank: 0
    )
    redirect_to "/trips/#{params[:trip_id]}/flights"
  end

  def show
    @trip = Trip.find_by(id: params[:trip_id].to_i)
    @flight = Flight.find_by(id: params[:flight_id].to_i)
    render 'show.html.erb'
  end

  def edit
    @flight = Flight.find_by(id: params[:flight_id].to_i)
  end

  def update
    @flight = Flight.find_by(id: params[:flight_id].to_i)
    @rank = @flight.rank += params[:rank].to_i

    @flight.update(
      airline: params[:airline] || @flight.airline,
      flight_number: params[:flight_number] || @flight.flight_number,
      date: params[:date] || @flight.date,
      depart_time: params[:depart_time] || @flight.depart_time,
      arrive_time: params[:arrive_time] || @flight.arrive_time,
      flight_direction: params[:flight_direction] || @flight.flight_direction,
      status: params[:confirmation] || "pending",
      trip_id: params[:trip_id],
      rank: @rank || @flight.rank
    )
    redirect_to "/trips/#{params[:trip_id]}/flights"
  end

  def destroy
    @flight = Flight.find_by(id: params[:flight_id])
    @flight.destroy
    redirect_to "/trips/#{params[:trip_id]}/flights"
  end
end
