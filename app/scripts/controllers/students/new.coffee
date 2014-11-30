'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:StudentsNewCtrl
 # @description
 # # StudentsNewCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'StudentsNewCtrl', ($scope, Utils, accountableNew) ->

    Utils.setPageTitle 'الطلاب - إضافة مستخدم'
    accountableNew($scope, 'student_accounts', 'student_account', '/students')
