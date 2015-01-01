'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:CoursesIndexCtrl
 # @description
 # # CoursesIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'CoursesIndexCtrl', ($scope, $http, Utils, BACKEND) ->

    Utils.setPageTitle('المواد')
    resource = "#{BACKEND}/courses"

    invalidate = ->
      $http.get(resource).then (res) ->
        $scope.courses = res.data.courses

    $scope.destroy = (courseId) ->
      $http.delete("#{resource}/#{courseId}").then invalidate

    invalidate()
