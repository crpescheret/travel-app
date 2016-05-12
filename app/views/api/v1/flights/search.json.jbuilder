json.array! @flights["trips"]["tripOption"].each do |flight|
  json.arrivalTime flight["slice"][0]["segment"][0]["leg"][0]["arrivalTime"]
  json.departureTime flight["slice"][0]["segment"][0]["leg"][0]["departureTime"]
  json.price flight["pricing"][0]["saleTotal"]
  json.carrier flight["slice"][0]["segment"][0]["flight"]["carrier"]
  json.flightNumber flight["slice"][0]["segment"][0]["flight"]["number"]
end