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
    resource = "#{BACKEND}/job_requests/#{applicantId}"

    successCallback = (res) ->
      job_request = res.data.job_request
      $scope.job_request = job_request
      Utils.setPageTitle "المتقدمين - #{job_request.fullname}"
      res

    invalidate = ->
      $http.get(resource).then successCallback

    decide = (decision) -> (id) ->
      $http.put("#{resource}/#{decision}").then successCallback

    $scope.update = ->
      $http.put(resource, job_request: $scope.job_request)
        .then(successCallback)
        .then (__) ->
          $scope.isEditing = false

    $scope.destroy = (id) ->
      $http.delete(resource).then (__) ->
        $location.path '/applicants'

    $scope.accept = decide('accept')
    $scope.reject = decide('reject')

    invalidate()
