'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:GuidesIndexCtrl
 # @description
 # # GuidesIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'GuidesIndexCtrl', ($scope, $location, $routeParams, $http, $log, Utils, BACKEND) ->

    studentsResource = "#{BACKEND}/student_accounts/without_guide"
    guidesResource   = "#{BACKEND}/guides"

    invalidate = ->
      if $routeParams.guide_id
        guideId = $routeParams.guide_id
        $http.get("#{guidesResource}/#{guideId}/students")
          .then (res) ->
            $scope.students = res.data.student_accounts
            res

      $http.get(guidesResource)
        .then (res) ->
          $scope.guides = res.data.guides
          res
        .catch (res) ->
          switch res.status
            when 401 then $location.path('/')

      $http.get(studentsResource)
        .then (res) ->
          $scope.studentsWithoutGuide = res.data.student_accounts
          res

    addOrRemoveStudent = (add) -> (guideId, studentId) ->
      action = if add then 'add_student' else 'remove_student'
      $http.put("#{guidesResource}/#{guideId}/#{action}/#{studentId}")
        .then(invalidate)

    $scope.removeStudentToGuide = addOrRemoveStudent(false)
    $scope.addStudentToGuide    = addOrRemoveStudent(true)

    $scope.studentsForGuide = (guideId) ->
      $location.search(guide_id: guideId)

    $scope.isCurrentGuide = (guideId) ->
      guideId == $routeParams.guide_id

    invalidate()