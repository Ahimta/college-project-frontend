'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:RecruitersNewCtrl
 # @description
 # # RecruitersNewCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'RecruitersNewCtrl', ($scope, accountableNew, Utils) ->

    Utils.setPageTitle 'وحدة التوظيف - إضافة مستخدم'
    accountableNew($scope, 'recruiter_accounts', 'recruiter_account', '/recruiters')
