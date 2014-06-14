'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:AdminnewCtrl
 # @description
 # # AdminnewCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'AdminnewCtrl', ($scope, $http, $location, BACKEND, Utils) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    Utils.setPageTitle 'وحدة المسؤولين - إضافة مسؤول'

    resource = "#{BACKEND}/admin/accounts"

    $scope.create = ->
      $http.post(resource, admin_account: $scope.record)
        .then (response) ->
          $location.path '/admins'
          response

        .catch (error) ->
          $log.debug error
