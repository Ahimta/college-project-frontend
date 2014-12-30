'use strict'

###*
 # @ngdoc service
 # @name collegeProjectFrontendApp.accountManager
 # @description
 # # accountManager
 # Factory in the collegeProjectFrontendApp.
###
angular.module('collegeProjectFrontendApp')
  .factory 'accountManager', ($rootScope, $location, $http, localStorageService, BACKEND, ROLES) ->

    keys =
      accessToken: 'accessToken'
      account:     'my_account'
      role:        'my_role'

    currentAccount = ->
      localStorageService.get(keys.account) || {}

    currentRole = ->
      localStorageService.get(keys.role) || ''

    currentAccount: currentAccount
    currentRole: currentRole
    accessToken: ->
      localStorageService.get(keys.accessToken) || ''
    isSupervisor: ->
      currentRole() == ROLES.supervisor
    isTeacher: ->
      currentRole() == ROLES.teacher
    isStudent: ->
      currentRole() == ROLES.student
    isGuide: ->
      currentAccount().is_guide and currentRole() == ROLES.teacher

    login: (role, username, password) ->
      $http.post("#{BACKEND}/sessions", username: username, password: password, role: role)
        .then (res) ->
          accessToken = res.data.access_token
          account     = res.data.account
          role        = res.data.account_role

          localStorageService.set keys.accessToken, accessToken
          localStorageService.set 'my_account', account
          localStorageService.set keys.role, role

          $rootScope.myAccountRole = role
          $rootScope.myAccount     = account

          $location.path switch role
            when ROLES.supervisor then '/students'
            when ROLES.recruiter  then '/applicants'
            when ROLES.teacher    then '/'
            when ROLES.student    then '/'
            when ROLES.admin      then '/recruiters'

          account: account
          role:    role

    logout: ->
      $http.delete("#{BACKEND}/sessions/current")
        .then (res) ->
          localStorageService.remove keys.accessToken
          localStorageService.remove 'my_account'
          localStorageService.remove keys.role

          res
