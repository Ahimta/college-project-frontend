'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'LoginCtrl', ($scope, $rootScope, $http, $location, $log, localStorageService, Utils,
    BACKEND) ->

    Utils.setPageTitle 'بوابة المسؤولين - تسجيل دخول'

    url = "#{BACKEND}/sessions"

    $scope.login = ->
      $http.post(url, username: $scope.user.username, password: $scope.user.password, role: $scope.role)
        .then (res) ->
          data        = res.data
          accessToken = data.access_token
          account     = data.account
          role        = data.account_role

          localStorageService.set 'accessToken', accessToken
          localStorageService.set 'my_account', account
          localStorageService.set 'my_role', role

          $rootScope.myAccountRole = role
          $rootScope.myAccount     = account

          $scope.loginFailed = false

          $location.path switch $scope.role
            when 'supervisor' then '/students'
            when 'recruiter' then '/applicants'
            when 'admin' then '/recruiters'

          res

        .catch (error) ->
          switch error.status
            when 401 then $scope.loginFailed = true
