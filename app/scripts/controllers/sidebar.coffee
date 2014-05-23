'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'SidebarCtrl', ($scope, Navbarable) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    links = [
      {
        title: 'APPLICANTS'
        path: '#/applicants'
      }
      {
        title: 'COURSES'
        path: '#/courses'
      }
      {
        title: 'TEACHERS'
        path: '#/teachers'
      }
      {
        title: 'STUDENTS'
        path: '#/students'
      }
    ]

    Navbarable $scope, links
