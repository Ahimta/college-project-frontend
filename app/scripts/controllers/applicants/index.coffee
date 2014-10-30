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
    url = "#{BACKEND}/job_requests"

    invalidate = ->
      $http.get(url)
        .then (response) ->
          $scope.applicants = response.data.job_requests
          response

        .catch (response) ->
          switch response.status
            when 401 then $location.path('/login/admin')


    decide = (decision, id) ->
      $http.put("#{url}/#{id}/#{decision}").then invalidate


    $scope.destroy = (id) ->
      $http.delete("#{url}/#{id}").then invalidate

    $scope.accept = (id) ->
      decide 'accept', id

    $scope.reject = (id) ->
      decide 'reject', id

    $scope.getClass = (isAccepted) ->
      switch isAccepted
        when 'pending'   then 'warning'
        when 'rejected'  then 'danger'
        when 'accepted'  then 'success'

    invalidate()
