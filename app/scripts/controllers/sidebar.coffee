'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'SidebarCtrl', ($scope, Navbarable) ->

    links = [
      {
        description: 'المتقدمين للوظائف اﻷكاديمية.'
        title: 'المتقدمين'
        path: '#/applicants'
        done: true
      }
      {
        description: 'مواد الطلاب و الأساتذة.'
        title: 'المواد'
        path: '#/courses'
        done: false
      }
      {
        description: 'بيانات الأساتذة.'
        title: 'اﻷساتذة'
        path: '#/teachers'
        done: false
      }
      {
        description: 'بيانات الطلاب.'
        title: 'الطلاب'
        path: '#/students'
        done: false
      }
    ]

    Navbarable $scope, links.reverse()
