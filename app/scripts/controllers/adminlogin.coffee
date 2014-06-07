'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'AdminloginCtrl', ($scope, $http, $location, BACKEND, Utils) ->

    Utils.setPageTitle 'بوابة المسؤولين - تسجيل دخول'

    url = "#{BACKEND}/admin/accounts/login"

    $scope.login = ->
      $http.post(url, login: $scope.user)
        .then (response) ->
          $location.path '/applicants'
        .catch (response) ->
          switch response.status
            when 401 then $scope.incorrect = true


