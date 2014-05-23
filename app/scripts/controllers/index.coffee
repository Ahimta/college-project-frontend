'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'IndexCtrl', ($scope, Sectionable) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    Sectionable $scope
