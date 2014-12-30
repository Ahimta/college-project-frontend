'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:ApplicantsCtrl
 # @description
 # # ApplicantsCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'ApplicantsCtrl', ($scope, $http, $location, BACKEND, Utils) ->

    Utils.setPageTitle 'المتقدمين'
    resource = "#{BACKEND}/job_requests"

    invalidate = ->
      $http.get(resource)
        .then (res) ->
          $scope.applicants = res.data.job_requests


    decide = (decision) -> (id) ->
      $http.put("#{resource}/#{id}/#{decision}").then invalidate

    $scope.destroy = (id) ->
      $http.delete("#{resource}/#{id}").then invalidate

    $scope.accept = decide('accept')

    $scope.reject = decide('reject')

    $scope.getClass = (isAccepted) ->
      switch isAccepted
        when 'pending'   then 'warning'
        when 'rejected'  then 'danger'
        when 'accepted'  then 'success'

    invalidate()
