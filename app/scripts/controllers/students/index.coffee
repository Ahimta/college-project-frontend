'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:StudentsIndexCtrl
 # @description
 # # StudentsIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'StudentsIndexCtrl', ($scope, $http, $log, Utils, BACKEND, AccountableIndex) ->

    Utils.setPageTitle 'الطلاب'
    AccountableIndex($scope, 'student_accounts', 'students')
