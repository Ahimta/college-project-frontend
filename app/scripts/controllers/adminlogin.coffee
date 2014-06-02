'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'AdminloginCtrl', ($scope, $location, Utils) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    Utils.setPageTitle 'بوابة المسؤولين - تسجيل دخول'

    $scope.login = ->
      $location.path '/applicants'
