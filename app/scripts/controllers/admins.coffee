'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'AdminsCtrl', ($scope, $http, $log, BACKEND, Utils) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    Utils.setPageTitle 'وحدة المسؤولين'

    url = "#{BACKEND}/admin/accounts"

    $http.get(url)
      .then (response) ->
        $scope.admins = response.data.admin_accounts
        response

      .catch (error) ->
        $log.debug error
