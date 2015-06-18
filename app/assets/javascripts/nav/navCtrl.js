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
  // Upon a successful login, two events will be broadcast, devise:login and devise:new-session, both with the currentUser as the argument.
  $scope.$on('devise:login', function(event, currentUser) {
      // after a login, a hard refresh, a new tab
      $scope.user = currentUser;
  });
  // Then a devise:new-registration event will be broadcast with the user object as the argument.
  $scope.$on('devise:new-registration', function(event, user) {
      $scope.user = user;
  });
}]);
