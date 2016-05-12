function initMap() {

  fetch('/api/v1/trips/' + tripId + '.json')
    .then(function(response) {
      return response.json();
    }).then(function(places) {
      console.log(places.accommodations);
      console.log(places.flights);

      var geocoder = new google.maps.Geocoder();

      places.accommodations.forEach(function(accommodation) {
        console.log(accommodation.address);

        geocoder.geocode({address: accommodation.address}, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: map,
              position: results[0].geometry.location
            });
          } else {
            console.log("Geocode was not successful: " + status);
          }
        });
      });

      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 8,
        center: geocoder.geocode({address: tripAddress})
      });

      // var map = new google.maps.Map(document.getElementById('map'), {
      //     zoom: 3,
      //     center: {lat: 0, lng: -180},
      //     mapTypeId: google.maps.MapTypeId.TERRAIN
      //   });

      //   var flightPlanCoordinates = [
      //     {lat: 37.772, lng: -122.214},
      //     {lat: 21.291, lng: -157.821},
      //     {lat: -18.142, lng: 178.431},
      //     {lat: -27.467, lng: 153.027}
      //   ];
      //   var flightPath = new google.maps.Polyline({
      //     path: flightPlanCoordinates,
      //     geodesic: true,
      //     strokeColor: '#FF0000',
      //     strokeOpacity: 1.0,
      //     strokeWeight: 2
      //   });

      //   flightPath.setMap(map);
           
    });

  

  // var places = [
  //   {address: "Chicago, IL", title: "Chicago", description: "Windy city"},
  //   {address: "1136 West Wellington, Chicago, IL", title: "Chicago", description: "Apartment"}
  // ];

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

