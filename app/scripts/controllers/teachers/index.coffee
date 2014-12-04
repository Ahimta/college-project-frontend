'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:TeachersIndexCtrl
 # @description
 # # TeachersIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'TeachersIndexCtrl', ($scope, $http, $log, Utils, BACKEND, AccountableIndex) ->

    Utils.setPageTitle 'الاساتذة'
    AccountableIndex($scope, 'teacher_accounts', 'teachers')
