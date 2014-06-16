'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:FacultyMembersIndexCtrl
 # @description
 # # FacultyMembersIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'FacultyMembersIndexCtrl', ($scope, Utils) ->

    Utils.setPageTitle 'وحدة الإرشاد'
