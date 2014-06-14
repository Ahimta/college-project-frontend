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

    url = "#{BACKEND}/admin/accounts"

    $http.get(url)
      .then (response) ->
        $scope.admins = response.data.admin_accounts
        response

      .catch (error) ->
        $log.debug error
