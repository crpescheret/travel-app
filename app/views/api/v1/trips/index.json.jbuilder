json.array! @trips.each do |trip|
  json.id trip.id
  json.title trip.title
  json.startDate trip.start_date
  json.endDate trip.end_date
  json.city trip.city
  json.state trip.state
  json.country trip.country
  json.userId trip.user_id
end