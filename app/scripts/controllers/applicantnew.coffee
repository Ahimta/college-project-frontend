'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'ApplicantnewCtrl', ($scope, $http, $location, BACKEND) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    $scope.create = ->
      $http.post("#{BACKEND}/applicants", applicant: $scope.applicant).then (response) ->
        $location.path '/applicants'
