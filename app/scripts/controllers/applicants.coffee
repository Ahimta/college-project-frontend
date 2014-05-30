'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'ApplicantsCtrl', ($scope, $http, BACKEND, Utils) ->

    Utils.setPageTitle 'المتقدمين'

    invalidate = ->
      $http.get("#{BACKEND}/applicants").then (response) ->
        $scope.applicants = response.data.applicants

    decide = (decision, id) ->
      $http.put("#{BACKEND}/applicants/#{id}/#{decision}").then invalidate

    $scope.destroy = (id) ->
      $http.delete("#{BACKEND}/applicants/#{id}").then invalidate

    $scope.accept = (id) ->
      decide 'accept', id

    $scope.reject = (id) ->
      decide 'reject', id

    invalidate()
