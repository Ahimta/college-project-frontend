'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:ApplicantshowCtrl
 # @description
 # # ApplicantshowCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'ApplicantshowCtrl', ($scope, $routeParams, $location, $http, BACKEND, Utils) ->

    applicantId = $routeParams.id
    url = "#{BACKEND}/job_requests/#{applicantId}"

    successCallback = (res) ->
      job_request = res.data.job_request
      $scope.job_request = job_request
      Utils.setPageTitle "المتقدمين - #{job_request.fullname}"
      res

    invalidate = ->
      $http.get(url).then successCallback

    decide = (decision, id) ->
      $http.put("#{url}/#{decision}").then successCallback

    $scope.update = ->
      $http.put(url, job_request: $scope.job_request)
        .then(successCallback)
        .then (res) ->
          $scope.isEditing = false
          res

    $scope.destroy = (id) ->
      $http.delete(url).then (_) ->
        $location.path '/applicants'

    $scope.accept = (id) ->
      decide 'accept', id

    $scope.reject = (id) ->
      decide 'reject', id

    invalidate()
