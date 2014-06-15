'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:RecruitersNewCtrl
 # @description
 # # RecruitersNewCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'RecruitersNewCtrl', ($scope, $http, $location, $log, BACKEND, Utils) ->

    Utils.setPageTitle 'وحدة المسؤولين - إضافة مسؤول'

    resource = "#{BACKEND}/recruiter/accounts"

    $scope.create = ->
      $http.post(resource, recruiter_account: $scope.recruiter_account)
        .then (response) ->
          $location.path '/recruiters'
          $scope.usernameConflict = false

          response

        .catch (error) ->
          $log.debug error

          switch error.status
            when 409 then $scope.usernameConflict = true
