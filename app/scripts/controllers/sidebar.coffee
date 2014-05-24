'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'SidebarCtrl', ($scope, Navbarable) ->

    links = [
      {
        title: 'APPLICANTS.TITLE'
        path: '#/applicants'
        done: true
      }
      {
        title: 'COURSES.TITLE'
        path: '#/courses'
        done: false
      }
      {
        title: 'TEACHERS.TITLE'
        path: '#/teachers'
        done: false
      }
      {
        title: 'STUDENTS.TITLE'
        path: '#/students'
        done: false
      }
    ]

    Navbarable $scope, links.reverse()
