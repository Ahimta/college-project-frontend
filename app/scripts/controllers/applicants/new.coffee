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
    resource = "#{BACKEND}/job_requests"

    $scope.create = ->
      $http.post(resource, job_request: $scope.job_request)
        .then (response) ->
          $location.path '/'
          response
