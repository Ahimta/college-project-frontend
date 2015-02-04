'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:StudentsShowCtrl
 # @description
 # # StudentsShowCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'StudentsShowCtrl', ($scope, $http, $location, $routeParams, $log, BACKEND, Utils, accountManager) ->

    studentId = $routeParams.id
    resource  = if accountManager.isGuide()
      "#{BACKEND}/guides/#{accountManager.currentAccount().id}/students/#{studentId}"
    else "#{BACKEND}/student_accounts/#{studentId}"

    addOrRemoveCourse = (isAdd) -> (courseId) ->
      action = if isAdd then 'add' else 'remove'
      $http.put("#{resource}/classes/#{courseId}/#{action}").then invalidate

    invalidate = ->
      $http.get("#{resource}/classes").then (res) ->
        $scope.currentCourses = res.data.classes.current
        $scope.studentSchedule = _.groupBy($scope.currentCourses, 'day')
        $scope.newCourses     = res.data.classes.not_current
        $scope.student        = res.data.student_account
        Utils.setPageTitle("الطالب - #{$scope.student.fullname}")

      if accountManager.isGuide()
        $scope.guide = accountManager.currentAccount()
      else
        $http.get("#{resource}/guide").then (res) ->
          $scope.guide = res.data.guide

    $scope.isSupervisor = accountManager.isSupervisor
    $scope.isStudent    = accountManager.isStudent
    $scope.isTeacher    = accountManager.isTeacher
    $scope.isGuide      = accountManager.isGuide
    $scope.isAdmin      = accountManager.isAdmin

    $scope.destroyStudent = ->
      $http.delete(resource).then (__) ->
        $location.path('/students')

    $scope.removeCourse = addOrRemoveCourse(false)
    $scope.addCourse    = addOrRemoveCourse(true)

    invalidate()
