class AccommodationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @trip = Trip.find_by(id: params[:trip_id].to_i)
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @accommodation = Accommodation.create(
      name: params[:name],
      property_type: params[:property_type],
      price: params[:price],
      address: params[:address],
      url: params[:url],
      status: "pending",
      rank: 0,
      trip_id: params[:trip_id]
    )
    redirect_to "/trips/#{params[:trip_id]}/accommodations"
  end

  def show
    @accommodation = Accommodation.find_by(id: params[:accommodation_id])
    render 'show.html.erb'
  end

  def edit
    @accommodation = Accommodation.find_by(id: params[:accommodation_id])
  end

  def update
    @accommodation = Accommodation.find_by(id: params[:accommodation_id])
    @rank = @accommodation.rank += params[:rank].to_i
    @accommodation.update(
      name: params[:name] || @accommodation.name,
      property_type: params[:property_type] || @accommodation.property_type,
      price: params[:price] || @accommodation.price,
      address: params[:address] || @accommodation.address,
      url: params[:url] || @accommodation.url,
      trip_id: params[:trip_id] || @accommodation.trip_id,
      status: params[:confirmation] || "pending",
      rank: @rank || @accommodation.rank
    )
    redirect_to "/trips/#{params[:trip_id]}/accommodations"
  end

  def destroy
    @accommodation = Accommodation.find_by(id: params[:accommodation_id])
    @accommodation.destroy
    redirect_to "/trips/#{params[:trip_id]}/accommodations"
  end
end
