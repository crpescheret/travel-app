json.array! @accommodations.each do |accommodation|
  json.id accommodation.id
  json.tripId accommodation.trip_id
  json.name accommodation.name
  json.price accommodation.price
  json.address accommodation.address
  json.status accommodation.status
  json.url accommodation.url
  json.rank accommodation.rank
  json.propertyType accommodation.property_type
end