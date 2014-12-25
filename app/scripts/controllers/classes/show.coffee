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

    invalidate = ->
      classId = $routeParams.id
      $http.get("#{BACKEND}/classes/#{classId}?expand=true")
        .then (res) ->
          $scope.students = res.data.students
          $scope.teacher  = res.data.teacher
          $scope.course   = res.data.course
          $scope.class    = res.data.class

    invalidate()
