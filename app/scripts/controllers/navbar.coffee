'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'NavbarCtrl', ($scope, $http, $location, BACKEND, Navbarable) ->

    url = "#{BACKEND}/admin/accounts/logout"

    $scope.logout = ->
      $http.delete(url)
        .then (response) ->
          $location.path '/'
        .catch (response) ->
          console.log response

    links = [
      {
        title: 'المتقدمين'
        path: '#/applicants'
      }
      {
        title: 'الصفحة الرئيسية'
        path: '#/'
      }
    ]

    Navbarable $scope, links
