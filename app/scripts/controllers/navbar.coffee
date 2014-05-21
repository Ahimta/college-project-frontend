'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'NavbarCtrl', ($scope, $location) ->

    $scope.isActive = (path) ->
      "##{$location.path()}" == path

    links = [
      {
        title: 'HOMEPAGE'
        path: '#/'
      }
      {
        title: 'DASHBOARD'
        path: '#/dashboard'
      }
    ]

    $scope.links = links.reverse()
