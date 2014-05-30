'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'StudentsCtrl', ($scope, Utils) ->

    Utils.setPageTitle 'الطلاب'

    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
