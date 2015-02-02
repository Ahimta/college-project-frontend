'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:StudentsShowAlertsIndexCtrl
 # @description
 # # StudentsShowAlertsIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'StudentsShowAlertsIndexCtrl', ($scope, $q, $http, $routeParams, accountManager, Utils, BACKEND) ->

    studentId = $routeParams.id

    $q.all([
      $http.get("#{BACKEND}/student_accounts/#{studentId}/alerts").then (res) ->
        $scope.studentAlerts = res.data.student_alerts
        $scope.student       = res.data.student_account
        Utils.setPageTitle("ملاحظات الطالب - #{$scope.student.fullname}")
    ])

    $scope.isSupervisor = accountManager.isSupervisor
    $scope.isGuide      = accountManager.isGuide
