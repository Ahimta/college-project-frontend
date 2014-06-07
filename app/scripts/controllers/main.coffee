'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'MainCtrl', ($scope, $http, BACKEND) ->

    $http.get("#{BACKEND}/admin/accounts/my_account")
      .then (response) ->
        $scope.myAccount = response.data.admin_account
