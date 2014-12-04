'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:TeachersNewCtrl
 # @description
 # # TeachersNewCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'TeachersNewCtrl', ($scope, Utils, accountableNew) ->

    Utils.setPageTitle 'الاساتذة - إضافة أستاذ'
    accountableNew($scope, 'teacher_accounts', 'teacher_account', '/teachers')
