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

    invalidateIfSupervisor = ->
      $q.all([
        $http.get("#{BACKEND}/classes/#{$routeParams.id}?expand=true").then (res) ->
          $scope.teacher  = res.data.teacher || res.data.teacher_account
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

    invalidateIfTeacher = ->
      teacherAccount = accountManager.currentAccount()
      teacherId      = teacherAccount.id
      classId        = $routeParams.id
      $http.get("#{BACKEND}/teacher_accounts/#{teacherId}/classes/#{classId}").then (res) ->
        $scope.students = res.data.students
        $scope.teacher  = res.data.teacher_account
        $scope.course   = res.data.course
        $scope.class    = res.data.class

    invalidate = if accountManager.isSupervisor() then invalidateIfSupervisor
    else invalidateIfTeacher

    addOrRemoveStudent = (isAdd) -> (studentId) ->
      action  = if isAdd then 'add' else 'remove'
      classId = $routeParams.id
      $http.put("#{BACKEND}/student_accounts/#{studentId}/classes/#{classId}/#{action}")
        .then invalidate

    $scope.removeStudent = addOrRemoveStudent(false)
    $scope.addStudent    = addOrRemoveStudent(true)

    $scope.isSupervisor = accountManager.isSupervisor
    $scope.isTeacher    = accountManager.isTeacher

    $scope.isEditing = ->
      $routeParams.action == 'edit'

    $scope.destroy = ->
      classId = $routeParams.id
      $http.delete("#{BACKEND}/classes/#{classId}").then invalidate

    $scope.update = (klass) ->
      classId = $routeParams.id
      $http.put("#{BACKEND}/classes/#{classId}", class: klass)
        .then (__) ->
          $location.path("/classes/#{classId}")
        .then null, (res) ->
          $scope.isNameConflict = res.status == 409

    invalidate()
