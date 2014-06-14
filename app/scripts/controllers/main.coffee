'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'MainCtrl', ($scope, $rootScope, $http, $timeout, BACKEND) ->

    $http.get("#{BACKEND}/accountable/my_account")
      .then (response) ->
        $rootScope.myAccountRole = response.data.role
        $rootScope.myAccount = response.data

        response
