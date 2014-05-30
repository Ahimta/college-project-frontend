'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'TeachersCtrl', ($scope, Utils) ->

    Utils.setPageTitle 'الأساتذة'

    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
