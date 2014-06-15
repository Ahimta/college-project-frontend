'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:RecruitersIndexCtrl
 # @description
 # # RecruitersIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'RecruitersIndexCtrl', ($scope, $http, $log, Utils, BACKEND) ->

    Utils.setPageTitle 'وحدة التوظيف'

    url = "#{BACKEND}/recruiter/accounts"

    $http.get(url)
      .then (response) ->
        $scope.recruiters = response.data.recruiter_accounts
        response

      .catch (error) ->
        $log.debug error
