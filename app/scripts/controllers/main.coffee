'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'MainCtrl', ($scope, $rootScope, $http, $cookieStore, BACKEND) ->

    $http.get("#{BACKEND}/accountable/my_account")
      .then (response) ->
        data = response.data
        account = response.data
        role = data.role

        $cookieStore.put 'my_account', account
        $cookieStore.put 'my_role', role

        $rootScope.myAccountRole = role
        $rootScope.myAccount = account

        response
