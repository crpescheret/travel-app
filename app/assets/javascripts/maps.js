function initMap() {

  fetch('/api/v1/trips/' + tripId + '.json')
    .then(function(response) {
      return response.json();
    }).then(function(places) {
      console.log(places.accommodations);

      var resultsMap = new google.maps.Map(document.getElementById('map'));
      var geocoder = new google.maps.Geocoder();
      var bounds = new google.maps.LatLngBounds();
      var infowindow = new google.maps.InfoWindow();
      var markers = [];

      places.accommodations.forEach(function(accommodation) {
        console.log(accommodation.address);

        geocoder.geocode({address: accommodation.address}, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
            marker.addListener('click', function() {
              infowindow.setContent(
                '<h4>' + accommodation.name + '</h4>' +
                '<p>' + accommodation.address + '</p>' +
                '<a href="/trips/' + tripId + '/accommodations/' + accommodation.id + '">View more</a>'
              );
              infowindow.open(resultsMap, marker);
            });
            markers.push(marker);
            for (var i = 0;i < markers.length; i++) {
              bounds.extend(markers[i].getPosition());
            }
            resultsMap.fitBounds(bounds);
          } else {
            console.log("Geocode was not successful: " + status);
          }
        });
      });
           
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

