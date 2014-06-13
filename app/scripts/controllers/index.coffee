'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'IndexCtrl', ($scope, Sectionable, Utils, Navbarable) ->

    Utils.setPageTitle 'الصفحة الرئيسية'

    Sectionable $scope
