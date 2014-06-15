'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'LoginCtrl', ($scope, $rootScope, $http, $location, $log, $cookieStore, Utils,
    BACKEND) ->

    Utils.setPageTitle 'بوابة المسؤولين - تسجيل دخول'

    url = "#{BACKEND}/accountable/login"

    $scope.login = ->
      $http.post(url, login: $scope.user, role: $scope.role)
        .then (response) ->
          data = response.data
          account = data.account
          role = data.role

          $cookieStore.put 'my_account', account
          $cookieStore.put 'my_role', role

          $rootScope.myAccount = account
          $rootScope.myAccountRole = role

          $scope.loginFailed = false

          $location.path switch $scope.role
            when 'recruiter' then '/applicants'
            when 'admin' then '/recruiters'

          response

        .catch (error) ->
          switch error.status
            when 401 then $scope.loginFailed = true
