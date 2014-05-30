'use strict'

angular.module('collegeProjectFrontendApp')
  .service 'Sectionable', ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope) ->

      scope.sections = [
        {
          title: 'المتقدمين'
          body: 'المتقدمين للوظائف اﻷكاديمية.'
          link: '#/applicants'
          done: true
        }
        {
          title: 'المواد'
          body: 'مواد الطلاب و الأساتذة.'
          link: '#/courses'
          done: false
        }
        {
          title: 'اﻷساتذة'
          body: 'بيانات الأساتذة.'
          link: '#/teachers'
          done: false
        }
        {
          title: 'الطلاب'
          body: 'بيانات الطلاب.'
          link: '#/students'
          done: false
        }
      ]
