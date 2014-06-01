'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'StudentloginCtrl', ($scope, Utils) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    Utils.setPageTitle 'بوابة الطلاب - تسجيل دخول'
