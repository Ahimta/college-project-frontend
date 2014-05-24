'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'StudentsCtrl', ($scope, Utils) ->

    Utils.setPageTitle 'STUDENTS.TITLE'
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
