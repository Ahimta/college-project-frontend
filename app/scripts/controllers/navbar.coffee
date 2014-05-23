'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'NavbarCtrl', ($scope, Navbarable) ->

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

    Navbarable $scope, links
