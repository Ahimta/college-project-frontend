'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:ClassesNewCtrl
 # @description
 # # ClassesNewCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'ClassesNewCtrl', ($scope, $q, $location, $http, BACKEND, Utils) ->

    Utils.setPageTitle('إضافة شعبة')

    $q.all([
      $http.get("#{BACKEND}/teacher_accounts").then (res) ->
        $scope.teachers = res.data.teacher_accounts

      $http.get("#{BACKEND}/courses").then (res) ->
        $scope.courses = res.data.courses
    ])

    $scope.create = (klass) ->
      $http.post("#{BACKEND}/classes", class: klass)
        .then (__) ->
          $location.path('/classes')
        .then null, (res) ->
          $scope.isNameConflict = res.status == 409
