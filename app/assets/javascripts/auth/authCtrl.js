angular.module('flapperNews')
.controller('AuthCtrl', [
'$scope',
'$state',
'Auth',
function($scope, $state, Auth) {
  Auth.currentUser().then(function(user){
    $scope.user = user;
  });
  $scope.login = function(){
    Auth.login($scope.user).then(function(){
      $state.go('home');
    });
  };
  // Upon a successful login, two events will be broadcast, devise:login and devise:new-session, both with the currentUser as the argument.
  $scope.$on('devise:login', function(event, currentUser) {
      // after a login, a hard refresh, a new tab
      $scope.user = currentUser;
  });
  $scope.register = function(){
    Auth.register($scope.user).then(function(){
      $state.go('home');
    });
  };
  // Then a devise:new-registration event will be broadcast with the user object as the argument.
  $scope.$on('devise:new-registration', function(event, user) {
      $scope.user = user;
  });
}]);