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
  $scope.register = function(){
    Auth.register($scope.user).then(function(){
      $state.go('home');
    });
  };
}]);