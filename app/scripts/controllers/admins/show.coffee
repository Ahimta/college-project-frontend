'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:AdminsShowCtrl
 # @description
 # # AdminsShowCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'AdminsShowCtrl', ($scope, $http, $location, $routeParams, Utils, BACKEND) ->

    resource = "#{BACKEND}/admin_accounts/#{$routeParams.id}"

    $http.get(resource).then (res) ->
      $scope.admin = res.data.admin_account
      Utils.setPageTitle("المسؤول - #{$scope.admin.fullname}")

    $scope.isEditing = ->
      $routeParams.action == 'edit'

    $scope.update = (adminAccount) ->
      $http.put(resource, admin_account: adminAccount).then (__) ->
        $location.path("/admins/#{$routeParams.id}")
