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
    url = "#{BACKEND}/applicant/job_requests/#{applicantId}"

    successCallback = (response) ->
      applicant = response.data.applicant_job_request || response.data.applicant_job_requests
      $scope.applicant = applicant
      Utils.setPageTitle "المتقدمين - #{applicant.full_name}"

    invalidate = ->
      $http.get(url).then successCallback

    decide = (decision, id) ->
      $http.put("#{url}/#{decision}").then invalidate

    $scope.update = ->
      $http.put(url, applicant_job_request: $scope.applicant)
        .then(successCallback)
        .then (_) ->
          $scope.isEditing = false

    $scope.destroy = (id) ->
      $http.delete(url).then (_) ->
        $location.path '/applicants'

    $scope.accept = (id) ->
      decide 'accept', id

    $scope.reject = (id) ->
      decide 'reject', id

    invalidate()
