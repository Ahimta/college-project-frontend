'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'SidebarCtrl', ($scope, Navbarable) ->

    links = [
      {
        description: 'APPLICANTS.BODY'
        title: 'APPLICANTS.TITLE'
        path: '#/applicants'
        done: true
      }
      {
        description: 'COURSES.BODY'
        title: 'COURSES.TITLE'
        path: '#/courses'
        done: false
      }
      {
        description: 'TEACHERS.BODY'
        title: 'TEACHERS.TITLE'
        path: '#/teachers'
        done: false
      }
      {
        description: 'STUDENTS.BODY'
        title: 'STUDENTS.TITLE'
        path: '#/students'
        done: false
      }
    ]

    Navbarable $scope, links.reverse()
