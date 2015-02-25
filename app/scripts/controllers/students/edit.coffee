'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:StudentsEditCtrl
 # @description
 # # StudentsEditCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'StudentsEditCtrl', ($scope, $q, $routeParams, $location, $http, accountManager, Utils, BACKEND) ->

    resource = "#{BACKEND}/student_accounts/#{$routeParams.id}"

    $q.all([
      $http.get(resource).then (res) ->
        $scope.student = res.data.student_account
        Utils.setPageTitle("الطالب - #{$scope.student.fullname}")

      $http.get("#{BACKEND}/guides").then (res) ->
        $scope.guides = (res.data.teacher_accounts || res.data.guides)
    ])

    $scope.update = (student) ->
      $http.put(resource, student_account: student)
        .then (__)  ->
          $location.path("/students/#{$routeParams.id}")
        .then null, (res) ->
          console.log('hi')
          $scope.usernameConflict = res.status == 409

    $scope.isSupervisor = accountManager.isSupervisor
    $scope.isGuide      = accountManager.isGuide
