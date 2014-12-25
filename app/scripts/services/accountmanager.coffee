'use strict'

###*
 # @ngdoc service
 # @name collegeProjectFrontendApp.accountManager
 # @description
 # # accountManager
 # Factory in the collegeProjectFrontendApp.
###
angular.module('collegeProjectFrontendApp')
  .factory 'accountManager', (localStorageService) ->

    currentAccount = ->
      localStorageService.get('my_account') || {}

    currentRole = ->
      localStorageService.get('my_role') || ''

    currentAccount: currentAccount
    currentRole: currentRole
    accessToken: ->
      localStorageService.get('accessToken') || ''
    isSupervisor: ->
      currentRole() == 'supervisor'
    isTeacher: ->
      currentRole() == 'teacher'
    isStudent: ->
      currentRole() == 'student'
    isGuide: ->
      currentAccount().is_guide and currentRole() == 'teacher'
