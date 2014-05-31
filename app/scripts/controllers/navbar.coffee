'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'NavbarCtrl', ($scope, Navbarable) ->

    links = [
      {
        title: 'لوحة التحكم'
        path: '#/dashboard'
      }
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]

    Navbarable $scope, links
