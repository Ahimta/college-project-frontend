'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:StudentsEditCtrl
 # @description
 # # StudentsEditCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'StudentsEditCtrl', ($scope, $q, $routeParams, $location, $http, Utils, BACKEND) ->

    $q.all([
      $http.get("#{BACKEND}/student_accounts/#{$routeParams.id}").then (res) ->
        $scope.student = res.data.student_account
        Utils.setPageTitle("الطالب - #{$scope.student.fullname}")

      $http.get("#{BACKEND}/guides").then (res) ->
        $scope.guides = (res.data.teacher_accounts || res.data.guides)
    ])

    $scope.update = (student) ->
      $http.put(resource, student_account: student)
        .then (__)  ->
          $location.path("/students/#{$routeParams.id}")
        .then (res) ->
          $scope.usernameConflict = res.status == 409