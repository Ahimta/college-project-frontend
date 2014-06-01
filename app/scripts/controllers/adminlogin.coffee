'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'AdminloginCtrl', ($scope, Utils) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    Utils.setPageTitle 'بوابة المسؤولين - تسجيل دخول'
