/* global angular */

(function() {
  angular.module('app').controller('flightsCtrl', function($scope, $http) {

    $scope.setup = function() {
      $http.get('/api/v1/flights.json').then(function(response) {
        $scope.flights = response.data;
      });
    };

    $scope.searchFlights = function(inputOrigin, inputDestination, inputDate) {
      var newSearch = {
        origin: inputOrigin,
        destination: inputDestination,
        date: inputDate
      };
      console.log(newSearch);
      $http.post('/api/v1/flights/search', newSearch).then(function(response) {
        console.log(response);
        $scope.results = response.data;
      });
    };

    $scope.toggleOption = function(inputOption) {
      console.log(inputOption);
      inputOption.detailsVisible = !inputOption.detailsVisible;
    };

    $scope.addFlight = function(inputAirline, inputFlightNumber, inputDeparture, inputArrival, inputPrice, inputOrigin, inputDestination, inputFlightDirection) {
      console.log(inputAirline, inputFlightNumber, inputDeparture, inputArrival, inputPrice, inputFlightDirection);
      var newFlight = {
        tripId: tripId,
        airline: inputAirline,
        flightNumber: inputFlightNumber,
        departureTime: inputDeparture,
        arrivalTime: inputArrival,
        price: inputPrice,
        departAirport: inputOrigin,
        arriveAirport: inputDestination,
        flightDirection: inputFlightDirection
      };
      $http.post('/api/v1/flights', newFlight).then(function(response) {
        console.log(response);
        $scope.flights.push(newFlight);
      }, function(errorResponse) {
        $scope.errors = errorResponse.data.errors;
      });
    };

  });
})();