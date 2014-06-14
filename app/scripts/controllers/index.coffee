'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:IndexCtrl
 # @description
 # # IndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'IndexCtrl', ($scope, Sectionable, Utils, Navbarable) ->

    Utils.setPageTitle 'الصفحة الرئيسية'

    Sectionable $scope
