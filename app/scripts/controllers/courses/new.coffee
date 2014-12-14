'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:CoursesNewCtrl
 # @description
 # # CoursesNewCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'CoursesNewCtrl', ($scope, $location, $routeParams, $http, $log, Utils, BACKEND) ->

    Utils.setPageTitle('إضافة مادة')

    resource = "#{BACKEND}/courses"

    $scope.create = (course) ->
      $http.post(resource, course: course)
        .then (res) ->
          $location.path('/courses')
          res
        .then null, (res) ->
          $scope.codeConflict = res.status == 409
          res
