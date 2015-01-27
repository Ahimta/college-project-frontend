'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:TeachersShowCtrl
 # @description
 # # TeachersShowCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'TeachersShowCtrl', ($scope, $q, $http, $location, $routeParams, accountManager, Utils, BACKEND) ->

    resource = "#{BACKEND}/teacher_accounts/#{$routeParams.id}"

    invalidate = ->
      $http.get("#{resource}/classes").then (res) ->
        $scope.newClasses = res.data.classes.not_current
        $scope.classes    = res.data.classes.current
        $scope.teacher    = res.data.teacher_account
        Utils.setPageTitle("الأستاذ - #{$scope.teacher.fullname}")

    addOrRemoveClass = (isAdd) -> (courseId) ->
      action = if isAdd then 'add' else 'remove'
      $http.put("#{resource}/classes/#{courseId}/#{action}")
        .then invalidate

    $scope.destroy = ->
      $http.delete(resource).then ->
        $location.path('/teachers')

    $scope.isEditing = ->
      $routeParams.action == 'edit'

    $scope.update = (teacher) ->
      $http.put(resource, teacher_account: teacher)
        .then (__) ->
          $location.path("/teachers/#{$routeParams.id}")
        .then null, (res) ->
          $scope.isUsernameConflict = res.status == 409

    $scope.removeClass = addOrRemoveClass(false)
    $scope.addClass    = addOrRemoveClass(true)

    $scope.isSupervisor = accountManager.isSupervisor
    $scope.isTeacher    = accountManager.isTeacher
    $scope.isStudent    = accountManager.isStudent

    invalidate()
