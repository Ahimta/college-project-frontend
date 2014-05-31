'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'ApplicantnewCtrl', ($scope, $http, $location, BACKEND, Utils) ->

    Utils.setPageTitle 'تقديم طلب'
    resource = "#{BACKEND}/applicants"

    $scope.create = ->
      $http.post(resource, applicant: $scope.applicant).then (_) ->
        $location.path '/'
