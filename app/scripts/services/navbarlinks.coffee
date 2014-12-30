'use strict'

###*
 # @ngdoc service
 # @name collegeProjectFrontendApp.navbarLinks
 # @description
 # # navbarLinks
 # Constant in the collegeProjectFrontendApp.
###
angular.module('collegeProjectFrontendApp')
  .constant 'navbarLinks',
    visitor: [
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]

    supervisor: [
      {
        title: 'الشعب'
        path: '#/classes'
      }
      {
        title: 'المواد'
        path: '#/courses'
      }
      {
        title: 'الطلاب'
        path: '#/students'
      }
      {
        title: 'الأساتذة'
        path: '#/teachers'
      }
      {
        title: 'المشرفين الأكاديميين'
        path: '#/guides'
      }
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]

    recruiter: [
      {
        title: 'المتقدمين'
        path: '#/applicants'
      }
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]

    student: [
      {
        title: 'المواد'
        path: '#/classes'
      }
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]

    teacher: [
      {
        title: 'المواد'
        path: '#/classes'
      }
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]

    guide: [
      {
        title: 'المواد'
        path: '#/classes'
      }
      {
        title: 'الطلاب'
        path: '#/students'
      }
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]

    admin: [
      {
        title: 'وحدة الإرشاد'
        path: '#/supervisors'
      }
      {
        title: 'وحدة التوظيف'
        path: '#/recruiters'
      }
      {
        title: 'وحدة المسؤولين'
        path: '#/admins'
      }
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]
