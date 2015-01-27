'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:GuidesShowCtrl
 # @description
 # # GuidesShowCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'GuidesShowCtrl', ($scope, $q, $location, $routeParams, $http, accountManager, Utils, BACKEND) ->

    studentsResource = "#{BACKEND}/student_accounts/without_guide"
    guidesResource   = "#{BACKEND}/guides"

    guideId = $routeParams.id

    invalidate = ->
        $q.all([
          $http.get("#{guidesResource}/#{guideId}/students").then (res) ->
            guide           = res.data.teacher_account
            $scope.students = res.data.student_accounts
            $scope.guide    = guide
            Utils.setPageTitle("المرشدين الأكادميين - #{guide.fullname}")

          if accountManager.isSupervisor()
            $http.get(studentsResource).then (res) ->
              $scope.studentsWithoutGuide = res.data.student_accounts
        ])

    addOrRemoveStudent = (isAdd) -> (studentId) ->
      action = if isAdd then 'add' else 'remove'
      $http.put("#{guidesResource}/#{guideId}/students/#{studentId}/#{action}")
        .then(invalidate)

    $scope.removeFromGuide = addOrRemoveStudent(false)
    $scope.addToGuide      = addOrRemoveStudent(true)

    $scope.isSupervisor = accountManager.isSupervisor
    $scope.isStudent    = accountManager.isStudent

    invalidate()
