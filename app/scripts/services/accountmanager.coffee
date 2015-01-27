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

    accessToken = ->
      localStorageService.get(keys.accessToken) || ''

    currentAccount: currentAccount
    currentRole:    currentRole
    accessToken:    accessToken
    currentAccountUrl: ->
      accountId = currentAccount().id
      role      = currentRole()
      switch role
        when ROLES.supervisor then "#/supervisors/#{accountId}"
        when ROLES.recruiter  then "#/recruiters/#{accountId}"
        when ROLES.student    then "#/students/#{accountId}"
        when ROLES.teacher    then "#/teachers/#{accountId}"
        when ROLES.admin      then "#/admins/#{accountId}"
    isSupervisor: ->
      currentRole() == ROLES.supervisor
    isTeacher: ->
      currentRole() == ROLES.teacher
    isStudent: ->
      currentRole() == ROLES.student
    isGuide: ->
      currentAccount().is_guide and currentRole() == ROLES.teacher
    isAdmin: ->
      currentRole() == ROLES.admin

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
            when ROLES.teacher
              if account.is_guide then "/guides/#{account.id}" else "/teachers/#{account.id}"
            when ROLES.student    then "/students/#{account.id}"
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
