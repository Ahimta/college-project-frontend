'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'ApplicantnewCtrl', ($scope, $http, $location, BACKEND, Utils) ->

    Utils.setPageTitle 'APPLICANTS.NEW'

    $scope.create = ->
      $http.post("#{BACKEND}/applicants", applicant: $scope.applicant).then (_) ->
        $location.path '/applicants'
