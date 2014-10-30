'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:RecruitersIndexCtrl
 # @description
 # # RecruitersIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'RecruitersIndexCtrl', ($scope, $http, $location, $log, Utils, BACKEND) ->

    Utils.setPageTitle 'وحدة التوظيف'

    url = "#{BACKEND}/recruiter_accounts"
    _isEditing = {}

    invalidate = ->
      $http.get(url)
        .then (response) ->
          $scope.recruiters = response.data.recruiter_accounts
          response

      .catch (error) ->
        $log.debug error

    $scope.update = (id, recruiter_account) ->
      $http.put("#{url}/#{id}", recruiter_account: recruiter_account)
        .then(invalidate)

    $scope.edit = (id) ->
      _isEditing[id] = true

    $scope.reset = (id) ->
      _isEditing[id] = false

    $scope.isEditing = (id) ->
      _isEditing[id]

    $scope.destroy = (id) ->
      $http.delete("#{url}/#{id}")
        .then(invalidate)

    invalidate()
