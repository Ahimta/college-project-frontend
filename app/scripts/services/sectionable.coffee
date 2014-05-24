'use strict'

angular.module('collegeProjectFrontendApp')
  .service 'Sectionable', ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope) ->

      scope.sections = [
        {
          title: 'APPLICANTS.TITLE'
          body: 'APPLICANTS.BODY'
          link: '#/applicants'
          done: true
        }
        {
          title: 'COURSES.TITLE'
          body: 'COURSES.BODY'
          link: '#/courses'
          done: false
        }
        {
          title: 'TEACHERS.TITLE'
          body: 'TEACHERS.BODY'
          link: '#/teachers'
          done: false
        }
        {
          title: 'STUDENTS.TITLE'
          body: 'STUDENTS.BODY'
          link: '#/students'
          done: false
        }
      ]
