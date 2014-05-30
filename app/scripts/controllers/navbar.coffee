'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'NavbarCtrl', ($scope, Navbarable) ->

    links = [
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
      {
        title: 'لوحة التحكم'
        path: '#/dashboard'
      }
    ]

    Navbarable $scope, links
