'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'SidebarCtrl', ($scope, Navbarable) ->

    links = [
      {
        description: 'بيانات المسؤولين'
        title: 'المسؤولين'
        path: '#/admins'
        done: false
      }
      {
        description: 'المتقدمين للوظائف اﻷكاديمية'
        title: 'المتقدمين'
        path: '#/applicants'
        done: true
      }
      {
        description: 'بيانات الأساتذة'
        title: 'اﻷساتذة'
        path: '#/teachers'
        done: false
      }
      {
        description: 'بيانات الطلاب'
        title: 'الطلاب'
        path: '#/students'
        done: false
      }
    ]

    Navbarable $scope, links
