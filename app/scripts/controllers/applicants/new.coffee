'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:ApplicantnewCtrl
 # @description
 # # ApplicantnewCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'ApplicantnewCtrl', ($scope, $http, $location, BACKEND, Utils) ->

    Utils.setPageTitle 'تقديم طلب'
    resource = "#{BACKEND}/applicant/job_requests"

    $scope.create = ->
      $http.post(resource, applicant_job_request: $scope.applicant)
        .then (response) ->
          $location.path '/'
          response
