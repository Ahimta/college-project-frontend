'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:CoursesShowCtrl
 # @description
 # # CoursesShowCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'CoursesShowCtrl', ($scope, $routeParams, $location, $http, Utils, BACKEND) ->

    invalidate = ->
      $http.get("#{BACKEND}/courses/#{$routeParams.id}/classes").then (res) ->
        classes = res.data.classes

        $scope.schedule = Utils.getSchedule(classes)
        $scope.classes  = classes
        $scope.course   = res.data.course

        $scope.hours = [8..22]
        $scope.days  = ['الأحد', 'الإثنين', 'الثلاثاء', 'الأربعاء', 'الخميس']

        Utils.setPageTitle("المادة - #{$scope.course.name}")

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
      $http.delete("#{BACKEND}/classes/#{classId}").then invalidate

    invalidate()
