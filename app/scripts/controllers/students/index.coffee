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

    url = "#{BACKEND}/student_accounts"

    invalidate = ->
      $http.get("#{url}?expand=true").then (res) ->
        $scope['students'] = res.data['student_accounts']

    $scope.isTeacher = accountManager.isTeacher
    $scope.isGuide   = accountManager.isGuide

    $scope.destroy = (id) ->
      $http.delete("#{url}/#{id}").then(invalidate)

    invalidate()
