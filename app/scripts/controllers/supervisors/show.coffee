'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:SupervisorsShowCtrl
 # @description
 # # SupervisorsShowCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'SupervisorsShowCtrl', ($scope, $http, $location, $routeParams, Utils, BACKEND) ->

    resource = "#{BACKEND}/supervisor_accounts/#{$routeParams.id}"

    $http.get(resource).then (res) ->
      $scope.supervisor = res.data.supervisor_account
      Utils.setPageTitle("وحدة الإرشاد - #{$scope.supervisor.fullname}")

    $scope.isEditing = ->
      $routeParams.action == 'edit'

    $scope.update = (supervisorAccount) ->
      $http.put(resource, supervisor_account: supervisorAccount).then (__) ->
        $location.path("/supervisors/#{$routeParams.id}")

    $scope.destroy = ->
      $http.delete(resource).then (__) ->
        $location.path('/supervisors')
