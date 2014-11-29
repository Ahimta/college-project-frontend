'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:SupervisorsNewCtrl
 # @description
 # # SupervisorsNewCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'SupervisorsNewCtrl', ($scope, $http, $location, $log, BACKEND, Utils) ->

    Utils.setPageTitle 'وحدة الإرشاد - إضافة مستخدم'

    resource = "#{BACKEND}/supervisor_accounts"

    $scope.create = ->
      $http.post(resource, supervisor_account: $scope.supervisor_account)
        .then (response) ->
          $location.path '/supervisors'
          $scope.usernameConflict = false

          response

        .catch (error) ->
          $log.debug error

          switch error.status
            when 409 then $scope.usernameConflict = true
