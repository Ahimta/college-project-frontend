'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:CoursesIndexCtrl
 # @description
 # # CoursesIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'CoursesIndexCtrl', ($scope, $location, $http, BACKEND, Utils) ->

    Utils.setPageTitle('المواد')
    resource = "#{BACKEND}/courses"

    errorHandler = (res) ->
      $location.path('/')

    invalidate = ->
      $http.get(resource)
        .then (res) ->
          $scope.courses = res.data.courses
        .then null, errorHandler

    $scope.destroy = (courseId) ->
      $http.delete("#{resource}/#{courseId}")
        .then invalidate, errorHandler

    invalidate()
