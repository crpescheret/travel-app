/* global angular */

(function() {
  angular.module('app').controller('flightsCtrl', function($scope, $http) {
    $scope.message = "hello";

    $scope.setup = function() {
      $http.get('/api/v1/flights.json').then(function(response) {
        $scope.flights = response.data;
      });
    };

  });
})();