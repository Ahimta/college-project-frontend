'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:CoursesShowCtrl
 # @description
 # # CoursesShowCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'CoursesShowCtrl', ($scope, $q, $routeParams, $location, $http, Utils, BACKEND) ->

    invalidate = ->
      $http.get("#{BACKEND}/courses/#{$routeParams.id}/classes")
        .then (res) ->
          $scope.classes = res.data.classes
          $scope.course  = res.data.course
          Utils.setPageTitle("المادة - #{$scope.course.name}")
        .then null, (__) ->
          $location.path('/')

    $scope.isEditing = ->
      $routeParams.action == 'edit'

    $scope.update = (course) ->
      courseId = $routeParams.id
      $http.put("#{BACKEND}/courses/#{courseId}", course: course)
        .then (__) ->
          $location.path("/courses/#{courseId}")
        .then null, (res) ->
          $scope.isCodeConflict = res.status == 409

    $scope.destroyClass = (classId) ->
      $http.delete("#{BACKEND}/classes/#{classId}")
        .then invalidate, (__) ->
          $location.path('/')

    invalidate()
