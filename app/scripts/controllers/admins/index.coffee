'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:AdminsCtrl
 # @description
 # # AdminsCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'AdminsCtrl', ($scope, $http, $log, BACKEND, Utils) ->

    Utils.setPageTitle 'وحدة المسؤولين'

    $http.get("#{BACKEND}/admin_accounts")
      .then (res) ->
        $scope.admins = res.data.admin_accounts
