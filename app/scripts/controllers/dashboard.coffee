'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'DashboardCtrl', ($scope, Sectionable, Utils) ->

    Utils.setPageTitle 'لوحة التحكم'

    Sectionable $scope
