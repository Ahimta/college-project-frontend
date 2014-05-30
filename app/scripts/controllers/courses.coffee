'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'CoursesCtrl', ($scope, Utils) ->

    Utils.setPageTitle 'المواد'

    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
