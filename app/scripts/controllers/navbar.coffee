'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:NavbarCtrl
 # @description
 # # NavbarCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'NavbarCtrl', ($scope, $rootScope, $http, $location, localStorageService, BACKEND,
    Navbarable) ->

    url = "#{BACKEND}/sessions/current"

    visitorLinks = [
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]

    supervisorLinks = [
      {
        title: 'الطلاب'
        path: '#/students'
      }
      {
        title: 'الأساتذة'
        path: '#/teachers'
      }
      {
        title: 'المشرفين الأكاديميين'
        path: '#/guides'
      }
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

    studentLinks = [
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]

    teacherLinks = [
      {
        title: 'الطلاب'
        path: '#/students'
      }
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]

    adminLinks = [
      {
        title: 'وحدة الإرشاد'
        path: '#/supervisors'
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
          localStorageService.remove 'accessToken'
          localStorageService.remove 'my_account'
          localStorageService.remove 'my_role'

          $rootScope.myAccount = undefined
          $rootScope.myAccountRole = undefined
          $rootScope.navbarLinks = visitorLinks

          $location.path '/'

          response

        .catch (response) ->
          console.log response

    $rootScope.navbarLinks = switch localStorageService.get 'my_role'
      when 'supervisor' then supervisorLinks
      when 'recruiter' then recruiterLinks
      when 'student' then studentLinks
      when 'teacher' then teacherLinks
      when 'admin' then adminLinks
      else visitorLinks

    Navbarable $scope
