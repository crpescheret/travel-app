class TripsController < ApplicationController
  before_action :authenticate_user!

  def index
    @trips = current_user.trips
  end

  def new
  end

  def create
    @trip = Trip.create(
      title: params[:title],
      city: params[:city],
      state: params[:state],
      country: params[:country],
      start_date: params[:start_date],
      end_date: params[:end_date],
      user_id: current_user.id
    )
    Group.create(
      user_id: current_user.id,
      trip_id: @trip.id
    )
    current_user.update_attribute :admin, true
    redirect_to '/trips'
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    @group = Group.find_by(trip_id: params[:id])
    @flight = Flight.find_by(id: params[:flight_id].to_i)
    @accommodation = Accommodation.find_by(id: params[:accommodation_id])
    render 'show.html.erb'
  end

  def edit
    if current_user.admin?
      @trip = Trip.find_by(id: params[:id])

    else 
      redirect_to "/"
    end
  end

  def update
    if current_user.admin?
      @trip = Trip.find_by(id: params[:id])
      @trip.update(
        title: params[:title],
        city: params[:city],
        state: params[:state],
        country: params[:country],
        start_date: params[:start_date],
        end_date: params[:end_date]
      )
      redirect_to "/trips/#{@trip.id}"
    else
      redirect_to "/"
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    if current_user.admin?
      @trip.destroy
      redirect_to '/trips'
    else
      redirect_to "/trips/#{@trip.id}"
    end  
  end
end
