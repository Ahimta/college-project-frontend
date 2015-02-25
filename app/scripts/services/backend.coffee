'use strict'

angular.module('collegeProjectFrontendApp')
  .constant 'BACKEND',
    if window.parent.location.hostname in ['localhost', '127.0.0.0', '127.0.0.1']
      'http://localhost:3000/api/v0'
    else
      '/api/v0'
