'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'ApplicantsCtrl', ($scope, $http, BACKEND) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    $http.get("#{BACKEND}/applicants").then (response) ->
      $scope.applicants = response.data.applicants
