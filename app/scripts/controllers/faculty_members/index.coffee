'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:FacultyMembersIndexCtrl
 # @description
 # # FacultyMembersIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'FacultyMembersIndexCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
