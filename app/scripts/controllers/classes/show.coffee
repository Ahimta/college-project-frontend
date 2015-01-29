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

    classId = $routeParams.id

    invalidateIfSupervisor = ->
      $q.all([
        $http.get("#{BACKEND}/classes/#{classId}?expand=true").then (res) ->
          $scope.teacher  = res.data.teacher || res.data.teacher_account
          $scope.course   = res.data.course
          $scope.class    = res.data.class
          Utils.setPageTitle("الشعبة - #{$scope.class.name}")

        $http.get("#{BACKEND}/classes/#{classId}/students").then (res) ->
          $scope.notStudents = res.data.students.not_current
          $scope.students    = res.data.students.current
      ])

    invalidateIfTeacher = ->
      teacherAccount = accountManager.currentAccount()
      teacherId      = teacherAccount.id
      $http.get("#{BACKEND}/teacher_accounts/#{teacherId}/classes/#{classId}").then (res) ->
        $scope.students = res.data.students
        $scope.teacher  = res.data.teacher_account
        $scope.course   = res.data.course
        $scope.class    = res.data.class
        Utils.setPageTitle("الشعبة - #{$scope.class.name}")

    invalidate = if accountManager.isSupervisor() then invalidateIfSupervisor
    else invalidateIfTeacher

    addOrRemoveStudent = (isAdd) -> (studentId) ->
      action  = if isAdd then 'add' else 'remove'
      $http.put("#{BACKEND}/student_accounts/#{studentId}/classes/#{classId}/#{action}")
        .then invalidate

    $scope.removeStudent = addOrRemoveStudent(false)
    $scope.addStudent    = addOrRemoveStudent(true)

    $scope.isSupervisor = accountManager.isSupervisor
    $scope.isTeacher    = accountManager.isTeacher

    currentEditedStudent = null

    $scope.isCurrentEditedStudent = (id) ->
      currentEditedStudent == id

    $scope.editStudent = (id) ->
      currentEditedStudent = id

    $scope.destroy = ->
      $http.delete("#{BACKEND}/classes/#{classId}").then invalidate

    $scope.updateStudent = (student) ->
      teacherAccount = accountManager.currentAccount()
      teacherId      = teacherAccount.id

      url = "#{BACKEND}/teacher_accounts/#{teacherId}/classes/#{classId}/students/#{student.id}"
      $http.put(url, student: _.pick(student, 'attendance', 'grades')).then (__) ->
        currentEditedStudent = null
        invalidate()

    invalidate()
