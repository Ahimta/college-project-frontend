'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:CoursesNewCtrl
 # @description
 # # CoursesNewCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'CoursesNewCtrl', ($scope, $location, $http, Utils, BACKEND) ->

    Utils.setPageTitle('إضافة مادة')

    resource = "#{BACKEND}/courses"

    $scope.create = (course) ->
      $http.post(resource, course: course)
        .then (res) ->
          $location.path('/courses')
        .then null, (res) ->
          $scope.codeConflict = res.status == 409
