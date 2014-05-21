'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'IndexCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    $scope.sections = [
      {
        title: 'APPLICANTS.TITLE'
        body: 'APPLICANTS.BODY'
        link: '#/applicants'
      }
      {
        title: 'COURSES.TITLE'
        body: 'COURSES.BODY'
        link: '#/courses'
      }
      {
        title: 'TEACHERS.TITLE'
        body: 'TEACHERS.BODY'
        link: '#/teachers'
      }
      {
        title: 'STUDENTS.TITLE'
        body: 'STUDENTS.BODY'
        link: '#/students'
      }
    ]
