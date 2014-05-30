'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'IndexCtrl', ($scope, Sectionable, Utils) ->

    Utils.setPageTitle 'الصفحة الرئيسية'

    Sectionable $scope
