'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'MainCtrl', ($scope, $rootScope, $http, BACKEND) ->

    $http.get("#{BACKEND}/accountable/my_account")
      .then (response) ->
        $rootScope.myAccountRole = response.data.role
        $rootScope.myAccount = response.data
