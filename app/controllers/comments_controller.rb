class CommentsController < ApplicationController
  def create
    @comment = Comment.create(
      text: params[:text],
      user_id: current_user.id,
      trip_id: params[:trip_id]
    )
    redirect_to "index.html.erb"
  end

  def index
    @trip = Trip.find_by(id: params[:trip_id])
    @comments = Comment.where(trip_id: @trip.id)
    render "index.html.erb"
  end
end
