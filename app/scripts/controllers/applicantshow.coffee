'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'ApplicantshowCtrl', ($scope, $routeParams, $location, $http, BACKEND, Utils) ->

    applicantId = $routeParams.id
    url = "#{BACKEND}/applicants/#{applicantId}"

    successCallback = (response) ->
      applicant = response.data.applicant
      $scope.applicant = applicant
      Utils.setPageTitle "المتقدمين - #{applicant.first_name} #{applicant.last_name}"

    invalidate = ->
      $http.get(url).then successCallback

    decide = (decision, id) ->
      $http.put("#{url}/#{decision}").then invalidate

    update = (id) ->
      $http.put(url, applicant: $scope.applicant)
        .then(successCallback)
        .then (_) ->
          $scope.isEditing = false

    $scope.create = ->
      update(applicantId)

    $scope.destroy = (id) ->
      $http.delete(url).then (_) ->
        $location.path '/applicants'

    $scope.accept = (id) ->
      decide 'accept', id

    $scope.reject = (id) ->
      decide 'reject', id

    invalidate()
