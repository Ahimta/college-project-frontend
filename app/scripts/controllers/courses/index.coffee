'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:CoursesIndexCtrl
 # @description
 # # CoursesIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'CoursesIndexCtrl', ($scope, $location, $routeParams, $http, $log, BACKEND, Utils) ->

    resource = "#{BACKEND}/courses"

    invalidate = ->
      $http.get(resource)
        .then (res) ->
          $scope.courses = res.data.courses
          res
        .then null, (res) ->
          $location.path('/')
          res

    $scope.destroy = (courseId) ->
      $http.delete("#{resource}/#{courseId}")
        .then invalidate, (res) ->
          $location.path('/')
          res

    invalidate()
