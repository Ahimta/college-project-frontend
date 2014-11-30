'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:SupervisorsNewCtrl
 # @description
 # # SupervisorsNewCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'SupervisorsNewCtrl', ($scope, accountableNew, Utils) ->

    Utils.setPageTitle 'وحدة الإرشاد - إضافة مستخدم'
    accountableNew($scope, 'supervisor_accounts', 'supervisor_account', '/supervisors')
