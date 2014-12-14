'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:StudentsIndexCtrl
 # @description
 # # StudentsIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'StudentsIndexCtrl', ($scope, $http, $log, $location, localStorageService, Utils, BACKEND, AccountableIndex) ->

    Utils.setPageTitle 'الطلاب'

    currentAccount = localStorageService.get('my_account')
    currentRole    = localStorageService.get('my_role')

    resource = if currentRole == 'teacher' and currentAccount.is_guide
      guideId = currentAccount.id
      "guides/#{guideId}/students"
    else
      'student_accounts'

    url = "#{BACKEND}/#{resource}"

    invalidate = ->
      $http.get(url)
        .then (response) ->
          $scope['students'] = response.data['student_accounts']
          response

        .catch (res) ->
          $location.path('/')
          $log.debug res

    $scope.destroy = (id) ->
      $http.delete("#{url}/#{id}")
        .then(invalidate)

    invalidate()
