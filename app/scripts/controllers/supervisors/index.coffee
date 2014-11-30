'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:SupervisorsIndexCtrl
 # @description
 # # SupervisorsIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'SupervisorsIndexCtrl', ($scope, Utils, AccountableIndex) ->

    Utils.setPageTitle 'وحدة الإرشاد'
    AccountableIndex($scope, 'supervisor_accounts', 'supervisors')
