angular.module('flapperNews')
.controller('NavCtrl', [
'$scope',
'Auth',
function($scope, Auth){
  Auth.currentUser().then(function(user){
    $scope.user = user;
  });
  $scope.signedIn = Auth.isAuthenticated;
  $scope.logout = Auth.logout;
  // Then a devise:logout event will be broadcast with the old currentUser as the argument.
  $scope.$on('devise:logout', function(event, oldCurrentUser) {
      $scope.user = {};
  });
}]);
