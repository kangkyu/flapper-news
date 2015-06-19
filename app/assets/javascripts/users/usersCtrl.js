angular.module('flapperNews')
.controller('UsersCtrl', [
'$scope',
'$http',
'$stateParams',
function($scope, $http, $stateParams){
  return $http.get('/users/' + $stateParams.id + '.json').then(function(res){
    $scope.user = res.data;
  });
}]);
