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
      $http.put("#{resource}/courses/#{courseId}/#{action}")
        .then invalidate, $log.debug

    invalidate = ->
      $http.get("#{resource}/courses")
        .then (res) ->
          $scope.currentCourses = res.data.courses.current
          $scope.newCourses     = res.data.courses.not_current
          $scope.student        = res.data.student_account
          Utils.setPageTitle("الطالب - #{$scope.student.fullname}")
          res
        .then null, (res) ->
          $log.debug('/students/:id/courses', res)
          $location.path('/')
          res

      if accountManager.isGuide()
        $scope.guide = accountManager.currentAccount()
      else
        $http.get("#{resource}/guide")
          .then (res) ->
            $scope.guide = res.data.guide
            res
          .then null, $log.debug

    $scope.isTeacher = accountManager.isTeacher
    $scope.isGuide   = accountManager.isGuide

    $scope.isEditing = ->
      $routeParams.mode == 'edit'

    $scope.edit = ->
      $location.path("/students/#{studentId}/edit")

    $scope.show = ->
      $location.path("/students/#{studentId}")

    $scope.update = (student) ->
      $http.put(resource, student_account: student)
        .then $scope.show, (res) ->
          $scope.usernameConflict = res.status == 409
          switch res.status
            when 401 then $location.path('/')

    $scope.destroyStudent = ->
      $http.delete(resource)
        .then (res) ->
          $location.path('/students')
          res
        .then null, (res) ->
          $log.debug(res)
          $location.path('/students')
          res

    $scope.removeCourse = addOrRemoveCourse(false)
    $scope.addCourse    = addOrRemoveCourse(true)

    invalidate()
