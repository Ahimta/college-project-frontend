'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:NavbarCtrl
 # @description
 # # NavbarCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'NavbarCtrl', ($scope, $rootScope, $http, $location, BACKEND, Navbarable) ->

    url = "#{BACKEND}/accountable/logout"

    $scope.logout = ->
      $http.delete(url)
        .then (response) ->
          $rootScope.myAccount = undefined
          $rootScope.myAccountRole = undefined
          $location.path '/'

          response

        .catch (response) ->
          console.log response

    $rootScope.navbarLinks = switch $rootScope.myAccountRole
      when 'recruiter'
        [
          {
            title: 'المتقدمين'
            path: '#/applicants'
          }
          {
            title: 'الصفحة الرئيسية'
            path: '#/'
          }
        ]
      when 'admin'
        [
          {
            title: 'وحدة الإرشاد'
            path: '#/guides'
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
      else
        [
          {
            title: 'الصفحة الرئيسية'
            path: '#/'
          }
        ]

    Navbarable $scope
