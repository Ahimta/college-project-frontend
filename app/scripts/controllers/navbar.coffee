'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'NavbarCtrl', ($scope, $location) ->

    $scope.isActive = (path) ->
      "##{$location.path()}" == path

    links = [
      {
        title: 'HOMEPAGE'
        path: '#/'
      }
      {
        hasDropDown: true
        title: 'APPLICANTS.TITLE'
        path: '#/applicants'
        sublinks: [
          {
            title: 'APPLICANTS.NEW'
            path: '#/applicants/new'
          }
        ]
      }
      {
        title: 'TEACHERS.TITLE'
        path: '#/teachers'
      }
      {
        title: 'STUDENTS.TITLE'
        path: '#/students'
      }
      {
        title: 'COURSES.TITLE'
        path: '#/courses'
      }
    ]

    $scope.links = if $scope.isArabic() then links.reverse() else links
