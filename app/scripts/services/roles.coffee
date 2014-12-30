'use strict'

###*
 # @ngdoc service
 # @name collegeProjectFrontendApp.ROLES
 # @description
 # # ROLES
 # Constant in the collegeProjectFrontendApp.
###
angular.module('collegeProjectFrontendApp')
  .constant 'ROLES',
    supervisor: 'supervisor'
    recruiter:  'recruiter'
    student:    'student'
    teacher:    'teacher'
    admin:      'admin'
