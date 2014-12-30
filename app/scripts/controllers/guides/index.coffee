'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:GuidesIndexCtrl
 # @description
 # # GuidesIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'GuidesIndexCtrl', ($scope, $q, $location, $routeParams, $http, Utils, BACKEND) ->

    Utils.setPageTitle('المرشدين الأكادميين')
    studentsResource = "#{BACKEND}/student_accounts/without_guide"
    teachersResource = "#{BACKEND}/teacher_accounts"
    guidesResource   = "#{BACKEND}/guides"

    currentGuideId = $scope.currentGuideId = $routeParams.guide_id

    invalidate = ->
        $q.all([
          if currentGuideId
            $http.get("#{guidesResource}/#{currentGuideId}/students").then (res) ->
              $scope.students = res.data.student_accounts

            $http.get("#{guidesResource}/#{currentGuideId}").then (res) ->
              guide = res.data.guide
              $scope.currentGuide = res.data.guide
              Utils.setPageTitle("المرشدين الأكادميين - #{guide.fullname}")

          $http.get(guidesResource).then (res) ->
            $scope.guides = res.data.guides

          $http.get(studentsResource).then (res) ->
            $scope.studentsWithoutGuide = res.data.student_accounts

          $http.get("#{teachersResource}/not_guides").then (res) ->
            $scope.teachersNotGuides = res.data.teacher_accounts
        ])

    addOrRemoveStudent = (add) -> (studentId) ->
      action = if add then 'add' else 'remove'
      $http.put("#{guidesResource}/#{currentGuideId}/students/#{studentId}/#{action}")
        .then(invalidate)

    addOrRemoveGuide = (isAdd) -> (teacherId) ->
      action = if isAdd then 'add_to_guides' else 'remove_from_guides'
      $http.put("#{teachersResource}/#{teacherId}/#{action}").then (res) ->
        if isAdd then invalidate()
        else $location.search('guide_id', null)


    $scope.removeFromGuide = addOrRemoveStudent(false)
    $scope.addToGuide      = addOrRemoveStudent(true)

    $scope.studentsForGuide = (guideId) ->
      $location.search('guide_id', guideId)

    $scope.isCurrentGuide = (guideId) ->
      guideId == currentGuideId

    $scope.removeGuide = addOrRemoveGuide(false)
    $scope.addGuide    = addOrRemoveGuide(true)

    invalidate()
