'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:NavbarCtrl
 # @description
 # # NavbarCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'NavbarCtrl', ($scope, $rootScope, $http, $location, $cookieStore, BACKEND,
    Navbarable) ->

    url = "#{BACKEND}/accountable/logout"

    visitorLinks = [
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]

    recruiterLinks = [
      {
        title: 'المتقدمين'
        path: '#/applicants'
      }
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]

    adminLinks = [
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

    $scope.logout = ->
      $http.delete(url)
        .then (response) ->
          $cookieStore.remove 'my_account'
          $cookieStore.remove 'my_role'

          $rootScope.myAccount = undefined
          $rootScope.myAccountRole = undefined
          $rootScope.navbarLinks = visitorLinks

          $location.path '/'

          response

        .catch (response) ->
          console.log response

    $rootScope.navbarLinks = switch $cookieStore.get 'my_role'
      when 'recruiter' then recruiterLinks
      when 'admin' then adminLinks
      else visitorLinks

    Navbarable $scope
