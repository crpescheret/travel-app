Rails.application.routes.draw do
  devise_for :users
  get '/' => 'trips#index'

  get '/trips' => 'trips#index'
  get '/trips/new' => 'trips#new'
  post '/trips' => 'trips#create'
  get '/trips/:id' => 'trips#show'
  get '/trips/:id/edit' => 'trips#edit'
  get '/trips/:id/itinerary' => 'trips#itinerary'
  patch '/trips/:id' => 'trips#update'
  delete '/trips/:id' => 'trips#destroy'

  get '/trips/:trip_id/flights' => 'flights#index'
  get '/trips/:trip_id/flights/new' => 'flights#new'
  post '/trips/:trip_id/flights' => 'flights#create'
  get '/trips/:trip_id/flights/:flight_id' => 'flights#show'
  get '/trips/:trip_id/flights/:flight_id/edit' => 'flights#edit'
  patch '/trips/:trip_id/flights/:flight_id' => 'flights#update'
  delete '/trips/:trip_id/flights/:flight_id' => 'flights#destroy'

  get '/trips/:trip_id/accommodations' => 'accommodations#index'
  get '/trips/:trip_id/accommodations/new' => 'accommodations#new'
  post '/trips/:trip_id/accommodations' => 'accommodations#create'
  get '/trips/:trip_id/accommodations/:accommodation_id' => 'accommodations#show'
  get '/trips/:trip_id/accommodations/:accommodation_id/edit' => 'accommodations#edit'
  patch '/trips/:trip_id/accommodations/:accommodation_id' => 'accommodations#update'
  delete '/trips/:trip_id/accommodations/:accommodation_id' => 'accommodations#destroy'

  get '/trips/:trip_id/maps' => 'maps#index'

  get '/trips/:trip_id/comments' => 'comments#index'

  get '/groups/new' => 'groups#new'
  post '/groups' => 'groups#create'

  namespace :api do
    namespace :v1 do
      get '/trips' => 'trips#index'
      get '/trips/:id' => 'trips#show'

      get '/flights' => 'flights#index'
      get '/flights/:id' => 'flights#show'
      post '/flights/search' => 'flights#search'
      post '/flights' => 'flights#create'

      get '/accommodations' => 'accommodations#index'
      get '/accommodations/:id' => 'accommodations#show'

      get 'trips/:trip_id/comments' => 'comments#index'
      post 'trips/:trip_id/comments' => 'comments#create'
    end
  end
end
