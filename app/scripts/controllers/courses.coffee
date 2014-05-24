'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'CoursesCtrl', ($scope, Utils) ->

    Utils.setPageTitle 'COURSES.TITLE'

    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
