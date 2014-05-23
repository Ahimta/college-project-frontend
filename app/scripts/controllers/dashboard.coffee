'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'DashboardCtrl', ($scope, Sectionable) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    Sectionable $scope
