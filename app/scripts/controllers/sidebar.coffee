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
        title: 'APPLICANTS.TITLE'
        path: '#/applicants'
      }
      {
        title: 'COURSES.TITLE'
        path: '#/courses'
      }
      {
        title: 'TEACHERS.TITLE'
        path: '#/teachers'
      }
      {
        title: 'STUDENTS.TITLE'
        path: '#/students'
      }
    ]

    Navbarable $scope, links.reverse()
