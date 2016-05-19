/* global angular, tripId */

(function() {
  angular.module('app').controller('flightsCtrl', function($scope, $http, $window) {

    $scope.setup = function() {
      $http.get('/api/v1/flights.json').then(function(response) {
        $scope.flights = response.data;
        
      });
      $scope.searchButtonText = "Search";
    };

    $scope.searchFlights = function(inputOrigin, inputDestination, inputDate) {
      $scope.searchButtonText = "Searching...";
      var newSearch = {
        origin: inputOrigin,
        destination: inputDestination,
        date: inputDate
      };
      console.log(newSearch);
      $http.post('/api/v1/flights/search', newSearch).then(function(response) {
        $scope.searchButtonText = "Search";
        console.log(response);
        $scope.results = response.data;
      }, function(response) {
        $scope.searchButtonText = "Search";
        console.log('error', response);
      });
    };

    $scope.toggleOption = function(inputOption) {
      console.log(inputOption);
      inputOption.detailsVisible = !inputOption.detailsVisible;
    };

    $scope.addFlight = function(inputAirline, inputFlightNumber, inputDeparture, inputArrival, inputPrice, inputOrigin, inputDestination, inputFlightDirection) {
      console.log(inputAirline, inputFlightNumber, inputDeparture, inputArrival, inputPrice, inputFlightDirection);
      var params = {
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

      console.log(params);
      $http.post('/api/v1/flights', params).then(function(response) {
        // console.log(response);
        // $scope.flights.push(params);
        $window.location.href = '/trips/' + tripId;
      }, function(errorResponse) {
        $scope.errors = errorResponse.data.errors;
      });
    };

   
  });
})();