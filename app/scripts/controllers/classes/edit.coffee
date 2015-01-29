'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:ClassesEditCtrl
 # @description
 # # ClassesEditCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'ClassesEditCtrl', ($scope, $q, $location, $routeParams, $http, Utils, BACKEND) ->

    classId = $routeParams.id

    invalidate = ->
      $q.all([
        $http.get("#{BACKEND}/classes/#{classId}").then (res) ->
          $scope.class    = res.data.class
          Utils.setPageTitle("الشعبة - #{$scope.class.name}")

        $http.get("#{BACKEND}/teacher_accounts").then (res) ->
          $scope.allTeachers = res.data.teacher_accounts

        $http.get("#{BACKEND}/courses").then (res) ->
          $scope.allCourses = res.data.courses
      ])

    $scope.update = (klass) ->
      $http.put("#{BACKEND}/classes/#{classId}", class: klass)
        .then (__) ->
          $location.path("/classes/#{classId}")
        .then null, (res) ->
          $scope.isNameConflict = res.status == 409

    invalidate()
