'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:AdminnewCtrl
 # @description
 # # AdminnewCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'AdminnewCtrl', ($scope, $http, $location, $log, BACKEND, Utils) ->

    Utils.setPageTitle 'وحدة المسؤولين - إضافة مسؤول'

    resource = "#{BACKEND}/admin_accounts"

    $scope.create = ->
      $http.post(resource, admin_account: $scope.record)
        .then (res) ->
          $location.path '/admins'
          $scope.usernameConflict = false

          res

        .catch (error) ->
          $log.debug error

          switch error.status
            when 409 then $scope.usernameConflict = true
