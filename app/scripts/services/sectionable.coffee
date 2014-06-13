'use strict'

angular.module('collegeProjectFrontendApp')
  .service 'Sectionable', ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope) ->

      scope.sections = [
        {
          title: 'وحدة التوظيف'
          body: 'المتقدمين للوظائف اﻷكاديمية.'
          link: '#/applicants'
          done: true
        }
        {
          title: 'وحدة الإرشاد'
          body: 'مواد الطلاب و الأساتذة.'
          link: '#/courses'
          done: false
        }
        {
          title: 'الأساتذة'
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
