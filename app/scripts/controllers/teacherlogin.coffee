'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'TeacherloginCtrl', ($scope, Utils) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    Utils.setPageTitle 'بوابة المرشدين - تسجيل دخول'
