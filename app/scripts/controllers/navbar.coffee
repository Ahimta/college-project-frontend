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
        title: 'APPLICANTS.TITLE'
        path: '#/applicants'
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
