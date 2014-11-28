'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'MainCtrl', ($scope, $rootScope, $http, $log, localStorageService, BACKEND) ->

    $http.get("#{BACKEND}/sessions/current")
      .then (res) ->
        account = res.data.account
        role    = res.data.account_role

        localStorageService.set 'my_account', account
        localStorageService.set 'my_role', role

        $rootScope.myAccountRole = role
        $rootScope.myAccount = account

        res

      .catch (res) ->
        $log.debug res

        localStorageService.remove 'my_account'
        localStorageService.remove 'my_role'
