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
    teachersResource = "#{BACKEND}/teacher_accounts"

    invalidate = ->
        $q.all([
          $http.get("#{BACKEND}/guides").then (res) ->
            $scope.guides = res.data.guides

          $http.get("#{BACKEND}/student_accounts/without_guide").then (res) ->
            $scope.studentsWithoutGuide = res.data.student_accounts

          $http.get("#{teachersResource}/not_guides").then (res) ->
            $scope.teachersNotGuides = res.data.teacher_accounts
        ])

    addOrRemoveGuide = (isAdd) -> (teacherId) ->
      action = if isAdd then 'add_to_guides' else 'remove_from_guides'
      $http.put("#{teachersResource}/#{teacherId}/#{action}")
        .then(invalidate)

    $scope.removeGuide = addOrRemoveGuide(false)
    $scope.addGuide    = addOrRemoveGuide(true)

    invalidate()
