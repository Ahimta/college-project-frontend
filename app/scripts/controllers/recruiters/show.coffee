'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:RecruitersShowCtrl
 # @description
 # # RecruitersShowCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'RecruitersShowCtrl', ($scope, $http, $location, $routeParams, accountManager, Utils, BACKEND) ->

    resource = "#{BACKEND}/recruiter_accounts/#{$routeParams.id}"

    $http.get(resource).then (res) ->
      $scope.recruiter = res.data.recruiter_account
      Utils.setPageTitle("وحدة التوظيف - #{$scope.recruiter.fullname}")

    $scope.isEditing = ->
      $routeParams.action == 'edit'

    $scope.update = (recruiterAccount) ->
      $http.put(resource, recruiter_account: recruiterAccount).then (__) ->
        $location.path("/recruiters/#{$routeParams.id}")

    $scope.destroy = ->
      $http.delete(resource).then (__) ->
        $location.path('/recruiters')

    $scope.isAdmin = accountManager.isAdmin
