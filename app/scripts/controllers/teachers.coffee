'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'TeachersCtrl', ($scope, Utils) ->

    Utils.setPageTitle 'TEACHERS.TITLE'

    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
