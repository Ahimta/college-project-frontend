'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'LoginCtrl', ($scope, accountManager, Utils) ->

    Utils.setPageTitle 'بوابة المسؤولين - تسجيل دخول'

    $scope.login = ->
      accountManager.login($scope.role, $scope.user.username, $scope.user.password)
        .then (__) ->
          $scope.loginFailed = false
        .then null, (res) ->
          $scope.loginFailed = res.status == 401
