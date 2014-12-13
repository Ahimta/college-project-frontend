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

    currentAccount = localStorageService.get('my_account')
    currentRole    = localStorageService.get('my_role')

    url = "#{BACKEND}/sessions/current"

    links =
      visitor: [
        {
          title: 'الصفحة الرئيسية'
          path: '#/'
        }
      ]

      supervisor: [
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

      recruiter: [
        {
          title: 'المتقدمين'
          path: '#/applicants'
        }
        {
          title: 'الصفحة الرئيسية'
          path: '#/'
        }
      ]

      student: [
        {
          title: 'الصفحة الرئيسية'
          path: '#/'
        }
      ]

      teacher: [
        {
          title: 'الصفحة الرئيسية'
          path: '#/'
        }
      ]

      guide: [
        {
          title: 'الطلاب'
          path: '#/students'
        }
        {
          title: 'الصفحة الرئيسية'
          path: '#/'
        }
      ]

      admin: [
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

          $rootScope.myAccountRole = undefined
          $rootScope.myAccount     = undefined
          $rootScope.navbarLinks   = links.visitor

          $location.path '/'

          response

        .catch (response) ->
          console.log response

    $rootScope.navbarLinks = switch currentRole
      when 'supervisor' then links.supervisor
      when 'recruiter' then links.recruiter
      when 'student' then links.student
      when 'teacher'
        if currentAccount.is_guide then links.guide
        else links.teacher
      when 'admin' then links.admin
      else links.visitor

    Navbarable $scope
