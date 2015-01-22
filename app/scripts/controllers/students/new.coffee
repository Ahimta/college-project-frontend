'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:StudentsNewCtrl
 # @description
 # # StudentsNewCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'StudentsNewCtrl', ($scope, $http, Utils, accountableNew, BACKEND) ->

    Utils.setPageTitle 'الطلاب - إضافة طالب'
    accountableNew($scope, 'student_accounts', 'student_account', '/students')
    $http.get("#{BACKEND}/guides").then (res) ->
      $scope.guides = (res.data.teacher_accounts || res.data.guides)
