'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'NavbarCtrl', ($scope, Navbarable) ->

    links = [
      {
        title: 'المتقدمين'
        path: '#/applicants'
      }
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]

    Navbarable $scope, links
