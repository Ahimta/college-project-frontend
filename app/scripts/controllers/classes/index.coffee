'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:ClassesIndexCtrl
 # @description
 # # ClassesIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'ClassesIndexCtrl', ($scope, $http, $location, accountManager, Utils, BACKEND) ->

    Utils.setPageTitle('الشعب')

    resource = switch accountManager.currentRole()
      when 'supervisor' then "#{BACKEND}/classes"
      when 'student'
        studentId = accountManager.currentAccount().id
        "#{BACKEND}/student_accounts/#{studentId}/classes"
      when 'teacher'
        teacherId = accountManager.currentAccount().id
        "#{BACKEND}/teacher_accounts/#{teacherId}/classes"

    invalidate = ->
      $http.get("#{resource}?expand=true").then (res) ->
        $scope.classes = res.data.classes.current || res.data.classes

    $scope.destroy = (classId) ->
      $http.delete("#{BACKEND}/classes/#{classId}").then invalidate

    $scope.isSupervisor = accountManager.isSupervisor
    $scope.isTeacher    = accountManager.isTeacher
    $scope.isStudent    = accountManager.isStudent

    invalidate()
