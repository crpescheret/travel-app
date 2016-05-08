function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 8,
    center: {lat: -34.397, lng: 150.644}
  });
  var geocoder = new google.maps.Geocoder();

  document.getElementById('submit').addEventListener('click', function() {
    geocodeAddress(geocoder, map);
  });
}

function geocodeAddress(geocoder, resultsMap) {
  var address = document.getElementById('address').value;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      resultsMap.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}

// function initMap() {
//   var myLatLng = {lat: -25.363, lng: 131.044};

//   var map = new google.maps.Map(document.getElementById('map'), {
//     zoom: 2,
//     center: myLatLng
//   });

//   var places = [
//     {lat: 41.9475011, lng: -87.6489932, title: "Xasdjfnajberu", description:"aaaaaaa"},
//     {lat: 42.3601, lng: -71.0589, title: "BBB", description: "bbbbbb"},
//     {lat: -34.6837, lng: -58.3816, title: "CCC", description: "ccccc"}
//   ];

//   var infowindow = new google.maps.InfoWindow({
//     content: 'temporary...'
//   });

//   places.forEach(function(place) {
//     var marker = new google.maps.Marker({
//       position: place,
//       map: map,
//       title: place.title
//     });
//     marker.addListener('click', function() {
//       infowindow.setContent(place.description);
//       infowindow.open(map, marker);
//     });
//   });
// }

