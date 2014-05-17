'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'NavbarCtrl', ($scope, $location) ->

    $scope.isActive = (path) ->
      "##{$location.path()}" == path

    $scope.links = [
      {
        title: 'APPLICANTS.TITLE'
        path: '#/applicants'
      },
      {
        title: 'TEACHERS.TITLE'
        path: '#/teachers'
      },
      {
        title: 'STUDENTS.TITLE'
        path: '#/students'
      },
      {
        title: 'COURSES.TITLE'
        path: '#/courses'
      }
    ]
