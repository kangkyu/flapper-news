angular.module('flapperNews', ['ui.router'])
.factory('posts', [function(){
  var o = {
    posts: [
      {title: 'post 1', upvotes: 5},
      {title: 'post 2', upvotes: 2},
      {title: 'post 3', upvotes: 15},
      {title: 'post 4', upvotes: 9},
      {title: 'post 5', upvotes: 4}
    ]
  };
  return o;
}])
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider){

  $stateProvider
    .state('home',{
      url: '/home',
      templateUrl: '/home.html',
      controller: 'MainCtrl'
    })
    .state('posts',{
      url: '/posts/{id}',
      templateUrl: '/posts.html',
      controller: 'PostsCtrl'
    });
  $urlRouterProvider.otherwise('home');

}])
.controller('MainCtrl', [
'$scope',
'$stateParams'
'posts',
function($scope, $stateParams, posts){
  $scope.posts = posts.posts;

  $scope.addPost = function() {
    if( !$scope.title || $scope.title === '') { return; }
    $scope.posts.push({title: $scope.title, link: $scope.link, upvotes: 0});
    $scope.title = '';
    $scope.link = '';
  };

  $scope.incrementUpvotes = function(post) {
    post.upvotes += 1;
  };

}])
.controller('PostsCtrl',[]);
