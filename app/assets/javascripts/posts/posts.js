angular.module('flapperNews')
.factory('posts', [function(){
  var o = {
    posts: [
      {title: 'post 1', upvotes: 5, link: '', comments: []},
      {title: 'post 2', upvotes: 2, link: '', comments: []},
      {title: 'post 3', upvotes: 15, link: '', comments: []},
      {title: 'post 4', upvotes: 9, link: '', comments: []},
      {title: 'post 5', upvotes: 4, link: '', comments: []}
    ]
  };
  return o;
}]);