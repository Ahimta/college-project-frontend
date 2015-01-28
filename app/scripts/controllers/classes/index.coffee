'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:ClassesIndexCtrl
 # @description
 # # ClassesIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'ClassesIndexCtrl', ($scope, $http, Utils, BACKEND, ROLES) ->

    Utils.setPageTitle('الشعب')

    resource = "#{BACKEND}/classes"

    invalidate = ->
      $http.get("#{resource}?expand=true").then (res) ->
        $scope.nonCurrentClasses = res.data.classes.not_current
        $scope.classes           = (res.data.classes.current || res.data.classes)

    addOrRemoveClass = (isAdd) -> (classId) ->
      action = if isAdd then 'add' else 'remove'
      $http.put("#{resource}/#{classId}/#{action}").then(invalidate)

    $scope.destroy = (classId) ->
      $http.delete("#{BACKEND}/classes/#{classId}").then(invalidate)

    $scope.removeClass = addOrRemoveClass(false)
    $scope.addClass    = addOrRemoveClass(true)

    invalidate()
