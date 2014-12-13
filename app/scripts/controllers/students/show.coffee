'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:StudentsShowCtrl
 # @description
 # # StudentsShowCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'StudentsShowCtrl', ($scope, $http, $location, $routeParams, $log, Utils, BACKEND) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    studentId = $routeParams.id
    resource = "#{BACKEND}/student_accounts/#{studentId}"

    invalidate = ->
      $http.get(resource)
        .then (res) ->
          $scope.student = res.data.student_account
          res
        .then null, (res) ->
          $log.debug('/students/:id', res)
          $location.path('/')
          res

    invalidate()
