class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Comment.where(trip_id: params[:trip_id])
    render "index.json.jbuilder"
  end

  def create
    @comment = Comment.create(
      text: params[:text],
      trip_id: params[:trip_id],
      user_id: params[:user_id]
    )
    @comments = Comment.where(trip_id: params[:trip_id])
    render "index.json.jbuilder"
  end
end