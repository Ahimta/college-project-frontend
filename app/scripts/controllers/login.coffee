'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'LoginCtrl', ($scope, $rootScope, $http, $location, Utils, BACKEND) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    Utils.setPageTitle 'بوابة المسؤولين - تسجيل دخول'

    url = "#{BACKEND}/accountable/login"

    $scope.login = ->
      $http.post(url, login: $scope.user, role: $scope.role)
        .then (response) ->
          $location.path switch $scope.role
            when 'recruiter' then '/applicants'
            when 'admin' then '/'

          $scope.loginFailed = false

          $rootScope.myAccount = response.data
          $rootScope.myAccountRole = response.data.role

          response

        .catch (error) ->
          switch error.status
            when 401 then $scope.loginFailed = true
