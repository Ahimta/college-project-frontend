'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'ApplicantshowCtrl', ($scope, $routeParams, $location, $http, BACKEND, Utils) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    applicantId = $routeParams.id
    url = "#{BACKEND}/applicants/#{applicantId}"

    invalidate = ->
      $http.get(url).then (response) ->
        applicant = response.data.applicant
        $scope.applicant = applicant
        Utils.setPageTitle "المتقدمين - #{applicant.first_name} #{applicant.last_name}"

    decide = (decision, id) ->
      $http.put("#{url}/#{decision}").then invalidate

    $scope.destroy = (id) ->
      $http.delete(url).then (_) ->
        $location.path '/applicants'

    $scope.accept = (id) ->
      decide 'accept', id

    $scope.reject = (id) ->
      decide 'reject', id

    invalidate()
