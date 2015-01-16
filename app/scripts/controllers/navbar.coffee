'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:NavbarCtrl
 # @description
 # # NavbarCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'NavbarCtrl', ($scope, $rootScope, $http, $location, accountManager, BACKEND, navbarLinks, Navbarable) ->

    currentAccount = accountManager.currentAccount()
    currentRole    = accountManager.currentRole()

    $scope.logout = ->
      accountManager.logout().then (__) ->
          $rootScope.myAccountRole = undefined
          $rootScope.myAccount     = undefined
          $rootScope.navbarLinks   = navbarLinks.visitor

          $location.path '/'

    $scope.currentAccountUrl = accountManager.currentAccountUrl

    $rootScope.navbarLinks = switch currentRole
      when 'supervisor' then navbarLinks.supervisor
      when 'recruiter' then navbarLinks.recruiter
      when 'student' then navbarLinks.student
      when 'teacher'
        if currentAccount.is_guide then navbarLinks.guide
        else navbarLinks.teacher
      when 'admin' then navbarLinks.admin
      else navbarLinks.visitor

    Navbarable $scope
