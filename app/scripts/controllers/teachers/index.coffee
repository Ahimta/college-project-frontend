'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:TeachersIndexCtrl
 # @description
 # # TeachersIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'TeachersIndexCtrl', ($scope, $http, $log, Utils, BACKEND, AccountableIndex) ->

    Utils.setPageTitle 'الاساتذة'
    AccountableIndex($scope, 'teacher_accounts', 'teachers')

    resource = "#{BACKEND}/teacher_accounts"

    invalidate = (res) ->
      $http.get(resource)
        .then (res) ->
          $scope.teachers = res.data.teacher_accounts
          res

    addOrRemoveToGuides = (isAdd) -> (teacherId) ->
      action = if isAdd then 'add_to_guides' else 'remove_from_guides'
      $http.put("#{resource}/#{teacherId}/#{action}")
        .then invalidate, $log.debug

    $scope.removeFromGuides = addOrRemoveToGuides(false)
    $scope.addToGuides      = addOrRemoveToGuides(true)