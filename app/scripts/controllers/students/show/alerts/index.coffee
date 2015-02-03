'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:StudentsShowAlertsIndexCtrl
 # @description
 # # StudentsShowAlertsIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'StudentsShowAlertsIndexCtrl', ($scope, $http, $routeParams, accountManager, Utils, BACKEND) ->

    studentId = $routeParams.id
    resource  = "#{BACKEND}/student_accounts/#{studentId}/alerts"

    invalidate = ->
      $http.get("#{BACKEND}/student_accounts/#{studentId}/alerts").then (res) ->
        $scope.studentAlerts = res.data.student_alerts
        $scope.student       = res.data.student_account
        Utils.setPageTitle("ملاحظات الطالب - #{$scope.student.fullname}")

    $scope.isSupervisor = accountManager.isSupervisor
    $scope.isGuide      = accountManager.isGuide

    $scope.addAlert = (alert) ->
      $http.post(resource, student_alert: alert)
        .then(invalidate)
        .then (__) ->
          alert.title = ''
          alert.body  = ''

    $scope.destroy = (alertId) ->
      $http.delete("#{resource}/#{alertId}").then(invalidate)

    invalidate()
