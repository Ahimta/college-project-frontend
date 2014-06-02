'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'AdminloginCtrl', ($scope, $location, Utils) ->

    Utils.setPageTitle 'بوابة المسؤولين - تسجيل دخول'

    $scope.login = ->
      $location.path '/applicants'
