'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:ClassesShowCtrl
 # @description
 # # ClassesShowCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'ClassesShowCtrl', ($scope, $q, $location, $routeParams, $http, accountManager, Utils, BACKEND) ->

    invalidate = ->
      $q.all([
        $http.get("#{BACKEND}/classes/#{$routeParams.id}?expand=true").then (res) ->
          $scope.teacher  = res.data.teacher
          $scope.course   = res.data.course
          $scope.class    = res.data.class
          Utils.setPageTitle("الشعبة - {{$scope.class.name}}")

        $http.get("#{BACKEND}/classes/#{$routeParams.id}/students").then (res) ->
          $scope.notStudents = res.data.students.not_current
          $scope.students    = res.data.students.current

        $http.get("#{BACKEND}/teacher_accounts").then (res) ->
          $scope.allTeachers = res.data.teacher_accounts

        $http.get("#{BACKEND}/courses").then (res) ->
          $scope.allCourses = res.data.courses
      ])
        .then (__) ->
          console.log $scope.allTeachers
          console.log $scope.allCourses
        .then null, (__) ->
          $location.path('/')

    addOrRemoveStudent = (isAdd) -> (studentId) ->
      action  = if isAdd then 'add' else 'remove'
      classId = $routeParams.id
      $http.put("#{BACKEND}/student_accounts/#{studentId}/classes/#{classId}/#{action}")
        .then invalidate

    $scope.removeStudent = addOrRemoveStudent(false)
    $scope.addStudent    = addOrRemoveStudent(true)

    $scope.isEditing = ->
      $routeParams.action == 'edit'

    $scope.update = (klass) ->
      classId = $routeParams.id
      $http.put("#{BACKEND}/classes/#{classId}", class: klass)
        .then (__) ->
          $location.path("/classes/#{classId}")
        .then null, (res) ->
          $scope.isNameConflict = res.status == 409

    invalidate()
