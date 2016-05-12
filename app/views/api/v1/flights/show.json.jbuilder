json.array! @flights.each do |flight|
  json.tripId flight.trip_id
  json.airline flight.airline
  json.flightNumber flight.flight_number
  json.departTime flight.depart_time
  json.arriveTime flight.arrive_time
  json.flightDirection flight.flight_direction
  json.status flight.status
  json.rank flight.rank
  json.id flight.id
  json.price flight.price
end