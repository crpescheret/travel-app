/* global angular */

(function() {
  angular.module('app').controller('commentsCtrl', function($scope, $http) {

    $scope.setup = function() {
      $http.get('/api/v1/trips/' + tripId + '/comments.json').then(function(response) {
        console.log(response);
        $scope.comments = response.data;
      });
    };

    $scope.addComment = function(inputText) {
      var newComment = {
        text: inputText,
        trip_id: tripId,
        user_id: userId
      };
      console.log(newComment);

      $http.post('/api/v1/trips/' + tripId + '/comments.json', newComment).then(function(response) {
        console.log(response);
        $scope.comments.push(newComment);
        $scope.newText = '';
      }, function(errorResponse) {
        $scope.errors = errorResponse.data.errors;
      });
    };

  });
})();