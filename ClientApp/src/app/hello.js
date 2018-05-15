'use strict';

var app = angular.module('assessment');

app
  .component('app', {
    templateUrl: 'app/hello.html',
    bindings: {
      blogposts: '='
    },
    controller: ['$scope', '$resource', '$log', function ($scope, $resource, $log) {
      $log.log('Running controller');
      var BlogpostsResource = $resource('/api/BlogPosts');
      $scope.blogposts = BlogpostsResource.query(function (data) {
        $scope.blogposts = data;
        $log.log('Fetched data');
      }, function (err) {
        $log.error('Error occurred', err);
      });
    }]
  });
