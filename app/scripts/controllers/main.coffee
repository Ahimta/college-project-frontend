'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'MainCtrl', ($scope, $rootScope, $http, $log, $cookieStore, BACKEND) ->

    $http.get("#{BACKEND}/sessions/current")
      .then (res) ->
        account = res.data.account
        role    = res.data.account_role

        $cookieStore.put 'my_account', account
        $cookieStore.put 'my_role', role

        $rootScope.myAccountRole = role
        $rootScope.myAccount = account

        res

      .catch (res) ->
        $log.debug res

        $cookieStore.remove 'my_account'
        $cookieStore.remove 'my_role'
