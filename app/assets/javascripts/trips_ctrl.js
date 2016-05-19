/* global angular */

(function() {
  angular.module('app').controller('tripsCtrl', function($scope, $http) {
    
    $scope.setup = function() {
      $http.get('/api/v1/flights/' + tripId).then(function(response) {
        console.log(response);
        $scope.flights = response.data;
      });

      $http.get('/api/v1/accommodations/' + tripId).then(function(response) {
        $scope.accommodations = response.data;
      });
    };

    $scope.changeOrderAttribute = function(inputAttribute) {
      if (inputAttribute === 'airline') {
        if ($scope.orderAttribute !== inputAttribute) {
          $scope.orderDescending = false;
        } else {
          $scope.orderDescending = !$scope.orderDescending;
        }
        $scope.orderAttribute = inputAttribute;
      } else {
        if ($scope.orderAttribute !== inputAttribute) {
          $scope.orderDescending = true;
        } else {
          $scope.orderDescending = !$scope.orderDescending;
        }
        $scope.orderAttribute = inputAttribute;
      }
    };

    $scope.changeAccOrderAttribute = function(inputAttribute) {
      if (inputAttribute === 'airline') {
        if ($scope.orderAttribute !== inputAttribute) {
          $scope.orderDescending = false;
        } else {
          $scope.orderDescending = !$scope.orderDescending;
        }
        $scope.orderAttribute = inputAttribute;
      } else {
        if ($scope.orderAttribute !== inputAttribute) {
          $scope.orderDescending = true;
        } else {
          $scope.orderDescending = !$scope.orderDescending;
        }
        $scope.orderAttribute = inputAttribute;
      }
    };

    $scope.showDirection = function(inputDirection) {
      $scope.directionFilter = inputDirection;
    };

  });
})();