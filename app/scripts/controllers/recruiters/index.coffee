'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:RecruitersIndexCtrl
 # @description
 # # RecruitersIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'RecruitersIndexCtrl', ($scope, Utils, AccountableIndex) ->

    Utils.setPageTitle 'وحدة التوظيف'
    AccountableIndex($scope, 'recruiter_accounts', 'recruiters')
