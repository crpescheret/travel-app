class GroupsController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    @group = Group.create(
      trip_id: params[:trip_id],
      user_id: params[:user_id]
    )
    redirect_to "/trips"
  end
end