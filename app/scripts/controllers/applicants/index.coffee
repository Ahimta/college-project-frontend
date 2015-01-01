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

    $http.get("#{BACKEND}/job_requests").then (res) ->
      $scope.applicants = res.data.job_requests

    $scope.getClass = (isAccepted) ->
      switch isAccepted
        when 'pending'   then 'warning'
        when 'rejected'  then 'danger'
        when 'accepted'  then 'success'
