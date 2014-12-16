'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:StudentsIndexCtrl
 # @description
 # # StudentsIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'StudentsIndexCtrl', ($scope, $http, $log, $location, accountManager, Utils, BACKEND, AccountableIndex) ->

    Utils.setPageTitle 'الطلاب'

    resource = if accountManager.isGuide()
      guideId = accountManager.currentAccount().id
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

    $scope.isTeacher = accountManager.isTeacher
    $scope.isGuide   = accountManager.isGuide

    $scope.destroy = (id) ->
      $http.delete("#{url}/#{id}")
        .then(invalidate)

    invalidate()
