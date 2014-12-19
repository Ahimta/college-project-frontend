'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:ClassesIndexCtrl
 # @description
 # # ClassesIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'ClassesIndexCtrl', ($scope, $http, $location, Utils, BACKEND) ->

    Utils.setPageTitle('الشعب')

    invalidate = ->
      $http.get("#{BACKEND}/classes?expand=true")
        .then (res) ->
          $scope.classes = res.data.classes
        .then null, (__) ->
          $location.path('/')

    $scope.destroy = (classId) ->
      $http.delete("#{BACKEND}/classes/#{classId}")
        .then invalidate, (__) ->
          $location.path('/')

    invalidate()
